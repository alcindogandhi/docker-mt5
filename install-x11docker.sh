#!/bin/sh

URL="https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker"

curl -fsSL $URL | sudo bash -s -- --update
sudo apt-get -y install catatonit nxagent wmctrl xserver-xephyr weston xwayland xdotool xauth xinit xclip wayland-utils
