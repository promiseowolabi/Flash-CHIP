#!/bin/bash

# Upgrade jessie
echo "."
echo "*** Updating and upgrading Debian Jessie. ***"
mv /etc/apt/sources.list /etc/apt/sources.list.bak
touch /etc/apt/sources.list
chmod 666 /etc/apt/sources.list
echo -e "deb [check-valid-until=no] http://archive.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src [check-valid-until=no] http://archive.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list
echo -e "deb [check-valid-until=no] http://archive.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src [check-valid-until=no] http://archive.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
echo -e "deb http://chip.jfpossibilities.com/chip/debian/repo jessie main" >> /etc/apt/sources.list
echo -e "deb http://chip.jfpossibilities.com/chip/debian/pocketchip jessie main" >> /etc/apt/sources.list

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
sudo touch /etc/apt/sources.list
sudo chmod 666 /etc/apt/sources.list

echo -e "deb http://ftp.us.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
echo -e "deb http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list
echo -e "deb-src http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list

echo "."
echo "*** apt update & upgrade ***"
apt-get update && apt-get upgrade -y
sleep 5

sudo chmod 666 /etc/NetworkManager/NetworkManager.conf
echo -e "[connection]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.mac-address-randomization=1" >> /etc/NetworkManager/NetworkManager.conf
echo -e "" >> /etc/NetworkManager/NetworkManager.conf
echo -e "[device]" >> /etc/NetworkManager/NetworkManager.conf
echo -e "wifi.scan-rand-mac-address=no" >> /etc/NetworkManager/NetworkManager.conf

echo "."
echo "*** Update to Stretch finished. Reboot to continue the process. ***"