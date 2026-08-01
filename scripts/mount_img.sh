#!/usr/bin/bash
if [ -f "usb-to-nas.conf" ]; then
	source usb-to-nas.conf
elif [ -f "/opt/usb-to-nas/usb-to-nas.conf" ]; then
	source /opt/usb-to-nas/usb-to-nas.conf
fi

IMG_FILE="${IMG_FILE:-/mnt/storage/drive.img}"


## Script
LOOP=$(losetup --show -fP $IMG_FILE)
echo $LOOP > /tmp/loop.cache

mkdir -p /mnt/drive
mount $LOOP /mnt/drive
