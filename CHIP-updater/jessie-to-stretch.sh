#!/bin/bash

# Upgrade jessie
echo "."
echo "*** Updating and upgrading Debian Jessie. ***"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo touch /etc/apt/sources.list
sudo chmod 666 /etc/apt/sources.list
echo -e "deb [check-valid-until=no] http://archive.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src [check-valid-until=no] http://archive.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list
echo -e "deb [check-valid-until=no] http://archive.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src [check-valid-until=no] http://archive.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
echo -e "deb http://chip.jfpossibilities.com/chip/debian/repo jessie main" >> /etc/apt/sources.list
echo -e "deb http://chip.jfpossibilities.com/chip/debian/pocketchip jessie main" >> /etc/apt/sources.list

echo "."
echo "*** Installing debian keyring. ***"
sudo apt-get install debian-keyring debian-archive-keyring -y --force-yes

echo "."
echo "*** apt update & upgrade ***"
sudo apt-get update && sudo apt upgrade -y

# Upgrade from jessie to stretch 
echo "."
echo "*** Upgrading Debian Jessie to Debian Stretch ***"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak2
sudo touch /etc/apt/sources.list
sudo chmod 666 /etc/apt/sources.list

echo -e "deb http://ftp.us.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
echo -e "deb http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list

echo "."
echo "*** apt update & upgrade ***"
sudo apt-get update && sudo apt upgrade -y

sudo chmod 666 /etc/NetworkManager/NetworkManager.conf
echo -e "[connection]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.mac-address-randomization=1" >> /etc/NetworkManager/NetworkManager.conf
echo -e "" >> /etc/NetworkManager/NetworkManager.conf
echo -e "[device]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.scan-rand-mac-address=no" >> /etc/NetworkManager/NetworkManager.conf

echo "*** Update to Stretch finished. Reboot to continue the process. ***"