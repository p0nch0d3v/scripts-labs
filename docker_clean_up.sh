#!/bin/sh

docker rm $(docker ps -a -q -f="status=exited")
docker rm $(docker ps -a -q -f="status=dead")
docker rmi $(docker images -a -q -f="dangling=true")
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)

docker ps -a
docker images -a
docker volume ls
docker network ls

