#!/bin/bash

# docker run -it --rm --name test_ub18 \
#     --privileged \
#     -e DISPLAY=$DISPLAY \
#     -v $(pwd)/../workspace:/home/${USER} \
#     -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
#     -w /home/${USER} \
#     robuntu:test

    # -p 5900:5900 \
# sudo docker run --name=test_ub18 -it --rm \
#     --tmpfs /run --tmpfs /run/lock --tmpfs /tmp \
#     --cap-add SYS_BOOT --cap-add SYS_ADMIN \
#     -v /sys/fs/cgroup:/sys/fs/cgroup \
#     -p 5900:5900 -p 5901:5901 -p 6901:6901 \
#     robuntu:test

# sudo apt update && sudo apt install -y x11vnc

# sudo docker run --name=test_ub18 -it --rm --privileged \
#     -e "ROS_HOSTNAME=localhost" \
#     -e "ROS_MASTER_URI=http://localhost:11311" \
#     --network host \
#     -e QT_X11_NO_MITSHM=1 \
#     -e DISPLAY=$DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
#     robuntu:test

VOLUME_PATH=$PWD/../workspace
USER_DOCKER=melodic
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
    -v $VOLUME_PATH:/home/$USER_DOCKER/test_folder \
    --runtime=nvidia \
    ub18_melodic:latest \
    tail -f /dev/null
