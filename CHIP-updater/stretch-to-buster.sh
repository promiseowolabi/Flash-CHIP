#!/bin/bash

# Upgrade from stretch to buster
echo "."
echo "*** Updating and upgrading Debian Stretch to Buster. ***"
mv /etc/apt/sources.list /etc/apt/sources.list.bak
wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/buster_source_list.txt
mv buster_source_list.txt /etc/apt/sources.list

apt-get install linux-image-armmp

echo "."
echo "*** apt update & upgrade ***"
apt-get update
apt-get full-upgrade
sleep 5


# Define X11 variables for buster
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.bak
wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/buster_x11.txt
mv buster_x11.txt /etc/X11/xorg.conf

echo "."
echo "*** Update to Stretch finished. Reboot***"
