#!/bin/sh

/usr/bin/syncthing serve --no-browser --logfile=default &
/usr/libexec/geoclue-2.0/demos/agent &
start-pulseaudio-x11 &
redshift-gtk -O 4500 &
wal -R &
sed -i 'N;$!P;D' $HOME/.cache/wal/colors-wal-dwm.h
remaps &
dunst &

dwmblocks &
echo "no" > $HOME/.cache/wmExit
while true
do
	wmExit=$(cat $HOME/.cache/wmExit)
	if [ $wmExit = "yes" ]
	then
		exit
	else
		dwm ;
	fi
done
