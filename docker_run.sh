#!/usr/bin/env bash

CONTAINER_NAME="msg_store-data_gen"
IMAGE="mrperson2015/message_store_data_gen"

# docker pull $IMAGE:latest

for container in `docker ps -a --format "{{.Names}}"`;
do
    if [ $container == $CONTAINER_NAME ];
    then
        echo "Stopping and Removing container [$CONTAINER_NAME]"
        docker rm --force "$CONTAINER_NAME"
    fi
done

docker run \
    -it \
    --name $CONTAINER_NAME \
    $IMAGE:latest /bin/bash