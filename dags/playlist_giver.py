from airflow.decorators import dag, task
from airflow import macros
import logging
import sys

# Basic logging stuff
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s"
)
logger = logging.getLogger("playlist_giver_logger")
file_handler = logging.FileHandler("logs/user_logged/playlist_logger.log")
file_handler.setFormatter("%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s")

default_args = {
    "owner": "Nishal",
    "start_date": macros.datetime.now(),
    "retries": 1,
    "retry_delay": macros.timedelta(minutes=5),
}


@dag("playlist_giver", schedule="*/5 * * * *", catchup=False, default_args=default_args)
def play_giver():
    @task
    def song_fetcher():
        import csv
        import random

        try:
            data_dict = {}
            with open("data/playlist_titles.csv", "r") as file:
                file_data = csv.reader(file, delimiter="U")
                for i in file_data:
                    i.pop()
                    output = "U".join(i)
                    data_dict[file_data.line_num] = output[0 : output.find(" --")]

            logger.info("Read Data File; Has Dictionary")

            len_of_data = max(data_dict.keys())
            random_num = random.randint(0, len_of_data - 1)

            logger.info("Generated Random Song")

            return list(data_dict.values())[random_num]

        except Exception as e:
            logger.error(f"Error: {e}")
            sys.exit(1)

    @task
    def data_loader(song):
        from sqlalchemy import create_engine, text
        from sqlalchemy.exc import ProgrammingError

        try:
            engine = create_engine("postgresql://airflow:airflow@5432", future=True)
            conn = engine.connect()
            conn.execute(text("commit"))
            conn.execute(text("create database playlists"))
            conn.execute(text("create table song_names (id serial, name varchar)"))

        except ProgrammingError as e:
            logger.error(f"Expected error: {e}")

        except Exception as e:
            logger.error(f"Error: {e}")
            sys.exit(1)

        try:
            engine = create_engine("postgresql://airflow:airflow@5432/playlists", future=True)
            conn = engine.connect()
            conn.execute(text("commit"))
            conn.execute(text("create table song_names (id serial, name varchar)"))

        except ProgrammingError as e:
            logger.error(f"Expected error: {e}")

        except Exception as e:
            logger.error(f"Error: {e}")
            sys.exit(1)

        try:
            conn.execute(text(f"INSERT INTO song_names (name) VALUES ({song})"))

        except Exception as e:
            logger.error(f"error: {e}")
            sys.exit(1)

    data_loader(song_fetcher())


play_giver()
