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
POSTGRES_IP_ADDR = os.getenv("MAIN_DB_CONN")


class DockerPostgresHook(BaseHook):
    def __init__(self, postgres_database: str):
        # self.postgres_container_name = postgres_container_name
        self.postgres_database = postgres_database

    def get_connection(self):
        from sqlalchemy import create_engine, text
        from sqlalchemy.exc import ProgrammingError

        # logger.info("Before `docker_client` is initialized")
        # docker_client = docker.from_env()
        # logger.info(f"Created `docker_client` variable: {docker_client=}")
        # postgres_container = docker_client.containers.get(self.postgres_container_name)
        # logger.info(f"Created `postgres_container` variable: {postgres_container=}")
        # postgres_ip_addr = postgres_container.attrs["NetworkSettings"]["Addresses"][
        #     "docker.com"
        # ][0]["Address"]
        # self.postgres_ip_addr = postgres_ip_addr

        # try:
        #     sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        #     sock.connect((POSTGRES_IP_ADDR, 5432))
        # except socket.timeout:
        #     raise TimeoutError("Connection timed out")

        logger.info(f"ip address: {POSTGRES_IP_ADDR}")

        engine = create_engine(
            POSTGRES_IP_ADDR,
            future=True,
        )
        logger.info("Created Engine")

        conn = engine.connect()

        logger.info("Created Connection")

        return conn
