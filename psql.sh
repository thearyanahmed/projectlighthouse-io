#!/usr/bin/env bash

# set -x
set -eo pipefail
docker exec -it $(docker ps -qf "ancestor=postgres") psql -U postgres

