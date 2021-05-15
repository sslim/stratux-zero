#!/bin/bash

#disable IPv6
echo 'net.ipv6.conf.all.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.eth0.disable_ipv6=1' | sudo tee -a /etc/sysctl.conf

#disable HDMI
sudo cp ./rc.local /etc/rc.local

#disable BT
#set blinking LED
sudo cp ./config.txt /boot/config.txt

#change stratux SSID
sudo cp ./hostapd.conf /etc/hostapd/hostapd.conf
echo "Change SSID and password in GUI"

#change password
passwd

#enable overlayFS
sudo cp ./raspi-config /usr/bin/raspi-config
sudo /usr/bin/raspi-config --enable-overlayfs

