# Airflow Dependencies
from airflow.decorators import dag, task


# Custom Airflow hook
from hooks.docker_postgres_hook import DockerPostgresHook

# Logging
import logging

# Typing
from typing import List
from io import TextIOWrapper

import sys
from datetime import datetime, timedelta

CONTAINER_DB = "playlists"
FILE_PATH = "data/playlist_titles.csv"
postgres_hook = DockerPostgresHook(CONTAINER_DB)


# Basic logging stuff for ease of understanding failures
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s"
)
logger = logging.getLogger("load_all_vids_logger")
file_handler = logging.FileHandler("logs/user_logged/load_all_vids_logger.log")
file_handler.setFormatter(
    logging.Formatter("%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s")
)
logger.addHandler(file_handler)

default_args = {
    "owner": "Nishal",
    "start_date": datetime(year=2023, month=11, day=26),
    "schedule": "@once",
    "retries": 1,
    "retry_delay": timedelta(seconds=5),
}


@dag(
    "load_all_vids",
    catchup=False,
    default_args=default_args,
)
def song_giver():
    @task
    def extract(file_path):
        import csv

        try:
            logger.info("Inside Extract Function")
            file = open(file_path, "r")
            reader = csv.reader(file, delimiter="\t")
            next(reader)

            data_list = []
            for line in reader:
                data_list.append(line)

            file.close()
            return data_list
        except FileNotFoundError as e:
            logger.error(f"Error: {e}")
            sys.exit(1)
        except Exception as e:
            logger.error(f"Error: {e}")
            sys.exit(1)

    @task
    def transform(data) -> List[str]:
        try:
            logger.info("Inside transform function")
            data_list = []
            for line in data:
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
    def load(song_list: List[str], hook: DockerPostgresHook):
        from sqlalchemy import text
        from sqlalchemy.exc import ProgrammingError

        logger.info("Inside load function")

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

    load(transform(extract(FILE_PATH)), postgres_hook)


song_giver()
