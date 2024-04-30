#!/bin/sh

/usr/libexec/geoclue-2.0/demos/agent &
redshift-gtk -t 5500:5500 &
xwallpaper --focus Pictures/synced/radha_large2.jpg
wal -R &
dunst &

exec dwm
