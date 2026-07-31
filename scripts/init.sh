#!/usr/bin/bash
# Load modules
echo "dtoverlay=dwc2,dr_mode=peripheral" | sudo tee -a /boot/firmware/config.txt
echo "libcomposite" | sudo tee -a /etc/modules-load.d/modules.conf
reboot
