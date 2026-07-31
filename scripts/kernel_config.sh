#!/usr/bin/bash
if [ -f "usb-to-nas.conf" ]; then
	source usb-to-nas.conf
elif [ -f "/opt/usb-to-nas/usb-to-nas.conf" ]; then
	source /opt/usb-to-nas/usb-to-nas.conf
fi


IMG_FILE="${IMG_FILE:-/mnt/storage/drive.img}"
SN="${SN:-1234567890}"
MFG="${MFG:-Raspberry Pi}"
PRODUCT="${PRODUCT:-usb-to-nas}"


GADGET_NAME="usbdrive"
DIR="/sys/kernel/config/usb_gadget/$GADGET_NAME"
STORAGE_FUNC="$DIR/functions/mass_storage.usb0"


## Script
## Nothing to touch down here
modprobe libcomposite
mkdir -p "$DIR"
cd "$DIR"

# Define Gadget
echo 0x1d6b > idVendor
echo 0x0104 > idProduct
echo 0x0100 > bcdDevice
echo 0x0200 > bcdUSB
mkdir -p strings/0x409
echo $SN > strings/0x409/serialnumber
echo $MFG > strings/0x409/manufacturer
echo $PRODUCT > strings/0x409/product

# Configuration
mkdir -p configs/c.1/strings/0x409
echo "Config 1: Mass Storage" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower

# Mass Storage Function
mkdir -p $STORAGE_FUNC
echo 1 > "$STORAGE_FUNC/lun.0/removable"
echo 0 > "$STORAGE_FUNC/lun.0/ro"
echo 0 > "$STORAGE_FUNC/lun.0/cdrom"
echo $IMG_FILE > "$STORAGE_FUNC/lun.0/file" 

# Link function to config
ln -s $STORAGE_FUNC "$DIR/configs/c.1"


# Bind to USB Device Controller
ls /sys/class/udc > UDC

