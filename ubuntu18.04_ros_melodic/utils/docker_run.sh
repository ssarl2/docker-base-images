#!/bin/bash

VOLUME_PATH=$PWD/../workspace
USER_DOCKER=melodic
IMAGE_VERSION=ssarl2/docker-base-images:latest

xhost +

sudo docker run --name=personal_ide --rm --privileged \
    --network host \
    -e "ROS_HOSTNAME=localhost" \
    -e "ROS_MASTER_URI=http://localhost:11311" \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e XAUTHORITY=$XAUTH \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $XAUTH:$XAUTH \
    -v $VOLUME_PATH:/home/$USER_DOCKER/workspace \
    -v /dev:/dev \
    $IMAGE_VERSION \
    tail -f /dev/null
