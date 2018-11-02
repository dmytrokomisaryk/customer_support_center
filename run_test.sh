#!/usr/bin/env bash

echo Testing Web

docker exec web rake db:create RAILS_ENV=test
docker exec web rake db:migrate RAILS_ENV=test
docker exec web rake test