#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
	exit 1
fi

workdir="$(dirname $(realpath ${BASH_SOURCE[0]}))"

#disable IPv6, gpsd fix
sudo patch -Nu -r - /etc/sysctl.conf -i "$workdir/stratux_sysctl.patch"
sudo patch -Nu -r - /lib/systemd/system/gpsd.socket -i "$workdir/stratux_gpsdsocket.patch"

#reboot
echo "You can reboot"
