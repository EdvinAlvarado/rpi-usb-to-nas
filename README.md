# USB-TO-NAS
This tool will make a Raspberry Pi simulate a usb drive and then periodically unlead the usb drive to another location (e.g. to a NAS)

1. Mount the NAS to `/mnt/nas`
2. Configure `/etc/fstab` to automount the NAS to `/mnt/nas`
3. Configure `usb-to-nas.conf` to your needs
3. Make image file using `./scripts/make_image.sh`
3. run `./scripts/init.sh`
4. run `sudo make enable`

