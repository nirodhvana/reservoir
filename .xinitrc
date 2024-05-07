#!/bin/sh

/usr/bin/syncthing serve --no-browser --logfile=default &
/usr/libexec/geoclue-2.0/demos/agent &
redshift-gtk &
start-pulseaudio-x11 &
xwallpaper --focus Pictures/synced/radha_large2.jpg &
wal -R &
remaps &
dunst &

slstatus &
exec dwm
