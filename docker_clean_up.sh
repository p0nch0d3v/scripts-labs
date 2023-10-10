#!/bin/sh

docker container rm $(docker container ls --all --quiet -f="status=exited")
docker container rm $(docker container ls --all --quiet -f="status=dead")
docker image rm $(docker image ls --all --quiet -f="dangling=true")
docker image prune --force
docker volume rm $(docker volume ls --quiet)
docker network rm $(docker network ls --quiet)

docker container ls --all
docker image ls --all 
docker volume ls
docker network ls
