#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    ros-melodic-nmea-msgs

echo 'source /opt/ros/melodic/setup.bash' >> /home/${USER}/.bashrc
