#!/bin/sh

# this container is documented here:
# https://hub.docker.com/r/itzg/minecraft-server/

MCHOME="/home/dan/.minecraft"

if [ $1 == "init" ]; then
  if [ ! -e "${MCHOME}" ]; then
    mkdir "${MCHOME}"
  fi

  docker run -d -it \
    -e EULA=TRUE \
    -e OPS=binbat \
    -e WHITELIST=binbat \
    -e SERVER_NAME=Titan \
    -e DIFFICULTY=normal \
    -e GENERATE_STRUCTURES=true \
    -e SNOOPER_ENABLED=false \
    -e ANNOUNCE_PLAYER_ACHIEVEMENTS=true \
    -v ${MCHOME}:/data \
    -e VERSION=1.13.2 \
    -p "25565:25565" --name mc itzg/minecraft-server
fi

if [ $1 == "stop" ]; then
  docker stop mc
fi

if [ $1 == "start" ]; then
  docker start mc
fi

if [ $1 == "status" ]; then
  docker exec mc mcstatus localhost status
fi

