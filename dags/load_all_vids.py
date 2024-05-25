# Airflow Dependencies
from airflow.decorators import dag, task
from airflow import macros

# Custom Airflow hook
from hooks.docker_postgres_hook import DockerPostgresHook

# Logging
import logging

# Typing
from typing import List

import sys

CONTAINER_DB = "playlists"
postgres_hook = DockerPostgresHook(CONTAINER_DB)


# Basic logging stuff
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s"
)
logger = logging.getLogger("playlist_giver_logger")
file_handler = logging.FileHandler("logs/user_logged/playlist_logger.log")
file_handler.setFormatter(
    logging.Formatter("%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s")
)
logger.addHandler(file_handler)

default_args = {
    "owner": "Nishal",
    "start_date": macros.datetime(2023, 11, 26),
    "retries": 1,
    "retry_delay": macros.timedelta(seconds=5),
}


@dag(
    "load_all_vids",
    catchup=False,
    default_args=default_args,
)
def play_giver():
    @task
    def song_fetcher() -> List[str]:
        import csv
        import random

        try:
            data_list = []
            with open("data/playlist_titles.csv", "r") as file:
                file_data = csv.reader(file, delimiter="\t")
                next(file_data)
                for line in file_data:
                    # Weird string changes for each line because joining later causes problems otherwise
                    for val_index in range(len(line)):
                        line[val_index] = f"'{line[val_index]}'"
                    data_list.append(line)

            logger.info("Read Data File; Has List")

            return data_list

        except Exception as error:
            logger.error(f"Error: {error}")
            sys.exit(1)

    @task
    def data_loader(song_list: List[str], hook: DockerPostgresHook):
        from sqlalchemy import text
        from sqlalchemy.exc import ProgrammingError

        try:
            conn = hook.get_connection()
        except TimeoutError:
            logger.error("Error: Connection timed out")
            raise TimeoutError("Connection timed out")
        except Exception as error:
            logger.error(f"Error: {error}")
            raise error

        try:
            conn.execute(text("commit"))
            conn.execute(
                text(
                    "create table if not exists songs (id serial, name varchar(255), channel_id varchar(26), channel_name varchar(255))"
                )
            )

        except ProgrammingError as e:
            logger.error(f"Expected error: {e}")

        except Exception as error:
            logger.error(f"Error: {error}")
            sys.exit(1)
        for song in song_list:
            try:
                insertions = ", ".join(song)
                conn.execute(
                    text(
                        f"INSERT INTO songs (name, channel_id, channel_name) VALUES ({insertions})"
                    )
                )
                logger.info(
                    f"INSERT INTO songs (name, channel_id, channel_name) VALUES ({insertions})"
                )

            except Exception as error:
                logger.error(f"error: {error}")
                sys.exit(1)

    data_loader(song_fetcher(), postgres_hook)


play_giver()
