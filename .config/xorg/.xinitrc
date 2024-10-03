#!/bin/sh
export PATH="${PATH}:${HOME}/.bashrc" &

/usr/bin/syncthing serve --no-browser --logfile=default &
redshift -O 4500 &
start-pulseaudio-x11 &
remaps &
sxhkd &
bgset &
dunst &
mpd &

slstatus &
echo "no" > $HOME/.cache/wmExit &
while true
do
	wmExit=$(cat $HOME/.cache/wmExit)
	if [ $wmExit = "yes" ]
 	then
         exit
 	else
         xrdb .Xresources
         dwm ;
     fi
done
