#!/bin/bash
set -e

mkdir -p /app/config
cat > /app/config/base.yml <<EOF
base_url: "${BASE_URL:-http://0.0.0.0:8080}"
port: ${PORT:-8081}
host: "${HOST:-0.0.0.0}"
database:
  driver: "${DB_DRIVER:-postgres}"
  host: "${DB_HOST:-localhost}"
  port: ${DB_PORT:-54321}
  username: "${DB_USERNAME:-postgres}"
  password: "${DB_PASSWORD:-password}"
  database_name: "${DB_NAME:-lighthouse}"
  require_ssl: ${DB_REQUIRE_SSL:-false}
EOF

exec /app/lighttheway
