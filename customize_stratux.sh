#!/bin/bash

#disable IPv6
echo 'net.ipv6.conf.all.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.eth0.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf

#disable HDMI
echo '/usr/bin/tvservice -o' | sudo tee -a /etc/rc.local

#disable BT
#set blinking LED
sudo cp ./config.txt /boot/config.txt

#enable overlayFS
sudo cp ./raspi-config /usr/bin/raspi-config
sudo ./usr/bin/raspi-config --enable-overlayfs

