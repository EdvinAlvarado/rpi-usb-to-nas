

install:
	mkdir -p /opt/usb-to-nas/scripts
	cp -f scripts/* /opt/usb-to-nas/scripts
	cp -f *sh /opt/usb-to-nas/
	cp -f *conf /opt/usb-to-nas/
	cp -f *service /etc/systemd/system/
	cp -f *timer /etc/systemd/system/

enable:
	systemctl daemon-reload
	systemctl enable --now usb-to-nas-startup.service
	systemctl enable --now usb-to-nas-backup.service

disable:
	systemctl disable --now usb-to-nas-startup.service
	systemctl disable --now usb-to-nas-backup.service
	systemctl disable --now usb-to-nas-backup.timer
	systemctl daemon-reload

uninstall: disable
	rm -rf /opt/usb-to-nas/*
	rm -f /etc/systemd/system/usb-to-nas-startup.service
	rm -f /etc/systemd/system/usb-to-nas-backup.service
	rm -f /etc/systemd/system/usb-to-nas-backup.timer
