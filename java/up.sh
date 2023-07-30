#!/bin/bash
set -euo pipefail

docker-compose down --rmi all --volumes --remove-orphans

docker compose up -d --build
docker compose exec app bash