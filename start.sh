#!/bin/bash

# Start rclone HTTP server for OneDrive (reads config from /config/rclone/rclone.conf)
rclone serve http onedrive: --addr :8080 --dir-cache-time 12h --vfs-cache-mode writes &

# Start Plex
/usr/lib/plexmediaserver/Plex\ Media\ Server
