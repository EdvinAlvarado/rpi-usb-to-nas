# USB-TO-NAS
This tool will make a Raspberry Pi simulate a usb drive and then periodically unlead the usb drive to another location (e.g. to a NAS)

1. Mount the NAS to `/mnt/nas`
2. Configure `/etc/fstab` to automount the NAS to `/mnt/nas`
3. Configure `usb-to-nas.conf` to your needs
3. Make image file using `sudo ./scripts/make_image.sh`
3. run `sudo ./scripts/init.sh`
4. run `sudo make install enable`


To uninstall the program run `sudo make uninstall`. It can be disabled with `sudo make disable`. The program can be re-enabled with `sudo make enable`.
