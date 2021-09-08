#!/bin/bash

export XDG_RUNTIME_DIR=/run/user/1001
export XAUTHORITY=/run/user/1001/gdm/Xauthority
export DISPLAY=:0
sudo x11vnc -forever

# export XDG_RUNTIME_DIR=/run/user/1001
# export XAUTHORITY=/var/run/lightdm/root/:0
# export DISPLAY=:0
# sudo x11vnc -forever -create
