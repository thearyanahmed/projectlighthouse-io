#!/bin/sh

set -eo

SQL_FILE="$1"

if [ -z "$SQL_FILE" ]; then
  echo "Usage: $0 <path-to-sql-file>"
  exit 1
fi

CONTAINER_ID=$(docker ps -qf "ancestor=postgres")

if [ -z "$CONTAINER_ID" ]; then
  echo "No running Postgres container found."
  exit 1
fi

docker exec -i "$CONTAINER_ID" psql -U postgres -d lighthouse < "$SQL_FILE"
