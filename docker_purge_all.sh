#!/bin/sh

docker container stop --time 1 $(docker container ls --all --quiet)
docker container rm --force $(docker container ls --all --quiet)
docker image rm --force $(docker image ls --all --quiet)
docker image prune --force
docker volume prune --force
docker network rm --force $(docker network ls --quiet)

docker container ls --all
docker image ls --all
docker volume ls
docker network ls
