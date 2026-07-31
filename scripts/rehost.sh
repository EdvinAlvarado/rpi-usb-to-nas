#!/usr/bin/bash
if [ -f "usb-to-nas.conf" ]; then
	source usb-to-nas.conf
elif [ -f "/opt/usb-to-nas/usb-to-nas.conf" ]; then
	source /opt/usb-to-nas/usb-to-nas.conf
fi

IMG_FILE="${IMG_FILE:-/mnt/storage/drive.img}"

GADGET_NAME="usbdrive"
DIR="/sys/kernel/config/usb_gadget/$GADGET_NAME"
STORAGE_FUNC="$DIR/functions/mass_storage.usb0"


## Script
## Nothing to touch down here
echo $IMG_FILE > "$STORAGE_FUNC/lun.0/file" 

