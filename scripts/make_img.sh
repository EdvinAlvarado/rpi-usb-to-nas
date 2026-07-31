#!/usr/bin/bash
if [ -f "usb-to-nas.conf" ]; then
	source usb-to-nas.conf
elif [ -f "/opt/usb-to-nas/usb-to-nas.conf" ]; then
	source /opt/usb-to-nas/usb-to-nas.conf
fi

IMG_FILE="${IMG_FILE:-/mnt/storage/drive.img}"
STORAGE_SIZE="${STORAGE_SIZE:-16G}"


sudo truncate -s $STORAGE_SIZE $IMG_FILE
sudo mkfs.fat -F 32 $IMG_FILE
