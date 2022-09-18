#!/bin/bash

echo 'source /opt/ros/melodic/setup.bash' >> /home/${USER}/.bashrc

sudo apt-get update
sudo apt-get install -y \
    cmake \
    curl \
    wget \
    nano \
    tree \
    bash-completion \
    ssh \
    build-essential \
    gdb \
    g++

#* python related
sudo apt-get install -y \
    python-pip \
    python3-pip \
    python3-vcstool \
    python3-catkin-tools

pip3 install -U catkin_tools
