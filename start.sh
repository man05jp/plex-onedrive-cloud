#!/bin/bash

rclone mount onedrive: /mnt/onedrive --allow-other --vfs-cache-mode writes &

/usr/sbin/start_pms

tail -f /dev/null
