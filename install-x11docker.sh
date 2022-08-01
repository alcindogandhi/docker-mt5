#!/bin/sh

URL="https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker"
curl -fsSL $URL | sudo bash -s -- --update
sudo apt -y install wmctrl xserver-xephyr xinit xauth xclip \
    x11-xserver-utils x11-utils weston xwayland xdotool
