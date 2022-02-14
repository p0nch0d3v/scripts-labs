
docker container rm $(docker container ls -a -q -f="status=exited")
docker container rm $(docker container ls -a -q -f="status=dead")
docker image rm $(docker image ls -a -q -f="dangling=true")
docker image prune --force
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)

docker container ls -a
docker image ls -a
docker volume ls
docker network ls
