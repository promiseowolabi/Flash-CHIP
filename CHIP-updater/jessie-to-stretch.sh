#!/bin/bash

mv /etc/rc.local.orig /etc/rc.local

# Upgrade jessie
echo "."
echo "*** Updating and upgrading Debian Jessie. ***"
mv /etc/apt/sources.list /etc/apt/sources.list.bak
wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/jessie_source_list.txt
mv jessie_source_list.txt /etc/apt/sources.list

echo "."
echo "*** Installing debian keyring. ***"
apt update
apt install debian-keyring debian-archive-keyring -y
sleep 5

echo "."
echo "*** apt update & upgrade ***"
apt update
apt upgrade -y
sleep 5

sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo dpkg-reconfigure locales
sudo dpkg-reconfigure tzdata


# Upgrade from jessie to stretch 
echo "."
echo "*** Upgrading Debian Jessie to Debian Stretch ***"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak2
wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/stretch_source_list.txt
mv stretch_source_list.txt /etc/apt/sources.list

echo "."
echo "*** apt update & upgrade ***"
apt update
apt install linux-image-armmp -y 
apt full-upgrade -y
sleep 5

# Define network variables
sudo chmod 666 /etc/NetworkManager/NetworkManager.conf
echo -e "[connection]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.mac-address-randomization=1" >> /etc/NetworkManager/NetworkManager.conf
echo -e "" >> /etc/NetworkManager/NetworkManager.conf
echo -e "[device]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.scan-rand-mac-address=no" >> /etc/NetworkManager/NetworkManager.conf

wget https://raw.githubusercontent.com/asophila/Flash-CHIP/master/CHIP-updater/stretch-to-buster.sh
chmod +x stretch-to-buster.sh
mv stretch-to-buster.sh /home/chip/
echo "."
echo "*** Update to Stretch finished. Reboot to continue the process. ***"
