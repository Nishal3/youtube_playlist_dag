from airflow.decorators import dag, task
from airflow import macros
import logging

# Basic logging stuff
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s"
)
logger = logging.getLogger("playlist_giver_logger")
file_handler = logging.FileHandler("opt/airflow/logs/user_logged/playlist_logger.log")
file_handler.setFormatter("%(asctime)s\t%(funcName)s\t%(levelname)s\t%(message)s")

default_args = {
    "owner": "Nishal",
    "start_date": macros.datetime.now(),
    "retries": 1,
    "retry_delay": macros.timedelta(minutes=5),
}


@dag("playlist_giver", schedule="*/5 * * * *", catchup=False)
def play_giver():
    @task
    def song_fetcher():
        import csv
        import random

        data_dict = {}
        with open("/opt/airflow/data/playlist_titles.csv", "r") as file:
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

    @task
    def data_loader(song):
        from sqlalchemy import create_engine, text
        from sqlalchemy.exc import ProgrammingError

    data_loader(song_fetcher)
