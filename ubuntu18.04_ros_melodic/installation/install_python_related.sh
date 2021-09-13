#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    python-pip \
    python-dev \
    python3-pip \
    python3-dev \
    python3-vcstool \
    python3-catkin-tools

pip3 install -U catkin_tools
