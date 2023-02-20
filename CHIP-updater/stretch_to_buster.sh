#!/bin/bash

# Upgrade jessie
echo "."
echo "*** Updating and upgrading Debian Jessie. ***"
mv /etc/apt/sources.list /etc/apt/sources.list.bak
wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/jessie_source_list.txt
mv jessie_source_list.txt /etc/apt/sources.list

echo "."
echo "*** Installing debian keyring. ***"
apt-get update
apt-get install debian-keyring debian-archive-keyring -y --force-yes
sleep 5

echo "."
echo "*** apt update & upgrade ***"
apt-get update && apt-get upgrade -y
sleep 5

# Upgrade from jessie to stretch 
echo "."
echo "*** Upgrading Debian Jessie to Debian Stretch ***"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak2
wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/stretch_source_list.txt
mv stretch_source_list.txt /etc/apt/sources.list

echo "."
echo "*** apt update & upgrade ***"
apt-get update && apt-get upgrade -y
sleep 5

# Define network variables
sudo chmod 666 /etc/NetworkManager/NetworkManager.conf
echo -e "[connection]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.mac-address-randomization=1" >> /etc/NetworkManager/NetworkManager.conf
echo -e "" >> /etc/NetworkManager/NetworkManager.conf
echo -e "[device]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.scan-rand-mac-address=no" >> /etc/NetworkManager/NetworkManager.conf

# Define X11 variables for stretch
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.bak
wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/stretch_x11.txt
mv stretch_x11.txt /etc/X11/xorg.conf

echo "."
echo "*** Update to Stretch finished. Reboot to continue the process. ***"