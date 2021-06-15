#!/bin/bash

export XDG_RUNTIME_DIR=/run/user/1000
export XAUTHORITY=/run/user/1000/gdm/Xauthority
export DISPLAY=:0
sudo x11vnc -passwd hyunbin -forever
