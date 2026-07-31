#!/usr/bin/bash
GADGET_NAME="usbdrive"
DIR="/sys/kernel/config/usb_gadget/$GADGET_NAME"
STORAGE_FUNC="$DIR/functions/mass_storage.usb0"


## Script
echo 1 > "$STORAGE_FUNC/lun.0/forced_eject"

