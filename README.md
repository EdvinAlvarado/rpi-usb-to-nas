# USB-TO-NAS
This tool will make a Raspberry Pi simulate a usb drive and then periodically unload the usb drive data to another location (e.g. to a NAS)

## USB Image File
The example script `make_image.sh` will create a 16GB FAT32 USB image file at `/mnt/storage/drive.img`. The default configuration will assume you ran that script. You can make the USB image file however and wherever you want, but remember to update the configuration file `/etc/usb-to-archive/usb-to-archive.conf` and restart uta-host.service for the changes to take effect.

## Raspbery Pi Configuration
To make the Raspberry Pi simulate a USB drive, you will need to configure the Raspberry Pi firmware and modules. You can do this by running the script `configure_rpi.sh`. **Note**: This will reboot the system.

## Bulding deb package
If the deb package is not available, you can build it from source.
```
./build-arm64-deb.sh
````
There may be some dependencies that need to be installed. If so, install them and re-run the script.

## Installing the program
```
sudo dpkg -i usb-to-nas_1.0_arm64.deb
```

