#!/usr/bin/env bash

# set -x
set -eo pipefail
SQLX_CLI_VERSION="0.8.6"

if ! [ -x "$(command -v psql)" ] ; then
	>&2 echo "psql is not install. exiting"
	exit 1
fi

if ! [ -x "$(command -v sqlx)" ]; then
	>&2 echo "sqlx not install. to install, run \n"
    >&2 echo "cargo install --version=${SQLX_CLI_VERSION} sqlx-cli --no-default-features --features postgres"

	exit 1
fi

export DB_PORT=${POSTGRES_PORT:-54321}
export DB_USER=${POSTGRES_USER:-postgres}
export DB_PASSWORD=${POSTGRES_PASSWORD:-password}
export DB_NAME=${POSTGRES_DB:-lighthouse}
export DATABASE_URL=postgres://${DB_USER}:${DB_PASSWORD}@localhost:${DB_PORT}/${DB_NAME}

# Wait for healthcheck
until docker inspect --format='{{.State.Health.Status}}' postgres | grep -q healthy; do
  echo "postgres still unavailable - sleeping"
  sleep 1
done

echo "Postgres is up and running on ${DATABASE_URL}!"

if ! sqlx database exists --database-url "$DATABASE_URL" >/dev/null 2>&1; then
	sqlx database create
fi

sqlx migrate run --source ./migrations
echo "postgres has been migrated."
