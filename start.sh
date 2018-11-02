if ! gem list docker-sync -i; then sudo gem install docker-sync; fi

docker-compose stop
docker-compose build

docker-sync-stack start