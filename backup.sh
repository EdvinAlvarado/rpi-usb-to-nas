#!usr/bin/bash

if [ -f "usb-to-nas.conf" ]; then
		source usb-to-nas.conf
elif [ -f "/opt/usb-to-nas/usb-to-nas.conf" ]; then
		source /opt/usb-to-nas/usb-to-nas.conf
fi

DES="${DES:-"/mnt/nas"}"

/opt/usb-to-nas/scripts/forced_eject.sh && \
/opt/usb-to-nas/scripts/mount_img.sh

rsync -avP --remove-source-files /mnt/drive/ $DES

/opt/usb-to-nas/scripts/umount_img.sh && \
/opt/usb-to-nas/scripts/rehost.sh
