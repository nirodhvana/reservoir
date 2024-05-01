#!/bin/sh

/usr/libexec/geoclue-2.0/demos/agent &
/usr/bin/syncthing serve --no-browser --logfile=default &
redshift-gtk -t 5500:5500 &
start-pulseaudio-x11 &
xwallpaper --focus Pictures/synced/radha_large2.jpg &
wal -R &
remaps &
dunst &

exec dwm
