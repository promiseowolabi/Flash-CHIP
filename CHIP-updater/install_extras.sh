#!/bin/bash

# Installing extras
echo "."
echo "*** installing extras. ***"

apt install neofetch -y
echo "neofetch" >> /home/chip/.bashrc

wget https://raw.githubusercontent.com/asophila/headless/main/startup.sh
mv startup.sh /home/chip/
chmod +x /home/chip/startup.sh

sed -i '$i \sh /home/chip/startup.sh\n' /etc/rc.local
chmod +x /etc/rc.local

echo -n "Insert a name for the ntfy.sh group where the network IP will be posted:"
read group
if [[ -z "$group" ]]; then
    $group="secret_ip"
fi
sed -i 's/SECRET_GROUP/$group/g' startup.sh

echo -n "Insert a name for this host:"
read hname
if [[ -z "$hname" ]]; then
    $hname="chip"
fi

hostnamectl set-hostname $hname

echo "."
echo "*** Done ***"
