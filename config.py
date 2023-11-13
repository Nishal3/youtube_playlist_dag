from airflow.hooks.base import BaseHook
from airflow.hooks.docker_postgres_hook import DockerPostgreHook

HOOKS: {"docker_postgres": DockerPostgresHook}
