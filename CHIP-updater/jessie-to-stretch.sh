#!/bin/bash

#mv /etc/rc.local.orig /etc/rc.local

# Upgrade jessie
#echo "."
#echo "*** Updating and upgrading Debian Jessie. ***"
#mv /etc/apt/sources.list /etc/apt/sources.list.bak
#wget https://raw.githubusercontent.com/promiseowolabi/Flash-CHIP/master/CHIP-updater/jessie_source_list.txt
#mv jessie_source_list.txt /etc/apt/sources.list

#echo "."
#echo "*** Installing debian keyring. ***"
#apt update
#apt install debian-keyring debian-archive-keyring -y
#sleep 5

#echo "."
#apt update
#echo "*** apt update & upgrade ***"
#apt upgrade -y --force-yes
#sleep 5

#sudo apt install locales -y
#sudo locale-gen en_US en_US.UTF-8
#sudo dpkg-reconfigure locales
#sudo dpkg-reconfigure tzdata


# Upgrade from jessie to stretch 
echo "."
echo "*** Upgrading Debian Jessie to Debian Stretch ***"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak2
wget https://raw.githubusercontent.com/promiseowolabi/Flash-CHIP/master/CHIP-updater/stretch_source_list.txt
mv stretch_source_list.txt /etc/apt/sources.list

echo "."
echo "*** apt update & upgrade ***"
apt update
apt install linux-image-armmp -y
DEBIAN_FRONTEND=noninteractive \
apt-get \
-o Dpkg::Options::="--force-confnew" \
--force-yes \
-fuy \
full-upgrade -y --force-yes
sleep 5

echo "."
echo "*** Update to Stretch finished. Reboot to continue the process. ***"
