#!/usr/bin/env bash
set -o errexit

echo Initializing Web

docker exec web rake db:create
docker exec web rake db:migrate
docker exec web rake db:seed

echo Done
