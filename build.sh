docker build . -t hobart2967/docker-spigot-mc-$MC_VERSION:$1 --build-arg MC_VERSION=$MC_VERSION
docker build . -t hobart2967/docker-spigot-mc-$MC_VERSION:latest --build-arg MC_VERSION=$MC_VERSION