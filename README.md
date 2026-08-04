# USB-TO-NAS
This tool will make a Raspberry Pi simulate a usb drive and then periodically unload the usb drive data to another location (e.g. to a NAS)

1. To automount the NAS to `/mnt/nas`, configure `/etc/fstab`. You will need to know the NAS's IP address or hostname and the share path. Make sure you create the mount directory before continuing (e.g. `sudo mkdir /mnt/nas`). You can edit /etc/fstab by `sudo nano /etc/fstab`.
    e.g. `[SERVER_IP]:[SRV_SHARE] [MNT_PATH]    nfs defaults,_netdev,nofail 0 0`. Save and exit.
2. Run `systemctl daemon-reload` and  `sudo mount -a` to mount nas and confirm it works. If this fails, verify the configuration you performed in `/etc/fstab`.
3. Configure `usb-to-nas.conf` to your needs. The default settings will setup a FAT32 16GB USB image file.
3. Make usb image file using `sudo ./scripts/make_image.sh`. Confirm if img file was created in path (e.g. `ls /mnt/storage`)
3. run `sudo ./scripts/init.sh`. **Note**: This will reboot the system
4. run `sudo make install enable` to install the program and enable the services.


To uninstall the program run `sudo make uninstall`. It can be disabled with `sudo make disable`. The program can be re-enabled with `sudo make enable`.
