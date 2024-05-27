from airflow.hooks.base import BaseHook
import logging
import os

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

# Environment Variable
POSTGRES_IP_ADDR = os.getenv("MAIN_DB_CONN")


class DockerPostgresHook(BaseHook):
    def __init__(self, postgres_database):
        self.postgres_database = postgres_database

    def get_connection(self):
        from sqlalchemy import create_engine, text
        from sqlalchemy.exc import ProgrammingError

        logger.info(f"ip address: {POSTGRES_IP_ADDR + self.postgres_database}")

        engine = create_engine(
            POSTGRES_IP_ADDR + self.postgres_database,
            future=True,
        )
        logger.info("Created Engine")

        conn = engine.connect()

        logger.info("Created Connection")

        return conn
