#!/bin/sh

/usr/bin/syncthing serve --no-browser --logfile=default &
/usr/libexec/geoclue-2.0/demos/agent &
start-pulseaudio-x11 &
redshift -O 5500 &
wal -R &
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
