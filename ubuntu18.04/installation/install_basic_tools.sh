#!/bin/bash

apt-get update
apt-get install -y \
    lsb-release \               # for ROS-melodic
    gnupg2 \                    # for ROS-melodic
    dirmngr \                   # https://stackoverflow.com/questions/54380518/why-does-this-apt-key-adv-command-give-an-error
    sudo \
    cmake \
    curl \
    wget \
    nano
