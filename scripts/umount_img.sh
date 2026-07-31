#!/usr/bin/bash
umount /mnt/drive
LOOP=$(< /tmp/loop.cache)
losetup -d $LOOP 
