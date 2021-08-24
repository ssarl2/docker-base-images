#!/bin/bash

VOLUME_PATH=$PWD/../workspace
USER_DOCKER=melodic
IMAGE_VERSION=ssarl2/docker-base-images:v1.1

xhost +
echo "Running docker env"

sudo docker run --name=ub18_melodic --rm --privileged \
    -e "ROS_HOSTNAME=localhost" \
    -e "ROS_MASTER_URI=http://localhost:11311" \
    --network host \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e XAUTHORITY=$XAUTH \
    -v $XAUTH:$XAUTH \
    -v $VOLUME_PATH:/home/$USER_DOCKER/workspace \
    -v /dev:/dev \
    --runtime=nvidia \
    $IMAGE_VERSION \
    tail -f /dev/null
