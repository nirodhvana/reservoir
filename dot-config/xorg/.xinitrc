#!/bin/sh

# This line try to import /etc/xprofile if it exists
[ -f ~/.xprofile ] && . ~/.xprofile

# Activate dbus variables
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval $(/usr/bin/dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment --verbose --all DISPLAY XAUTHORITY

#/usr/bin/syncthing serve --no-browser --logfile=default &
xrdb $HOME/.Xresources &
gammastep -O 2500 &

autostart &

# Fix overscan problem on HDMI TV when underscan isnt available
# Docs: https://www.engadget.com/2010-05-27-hd-101-overscan-and-why-all-tvs-do-it.htm://www.engadget.com/2010-05-27-hd-101-overscan-and-why-all-tvs-do-it.html
# Soln: https://evilshit.wordpress.com/2012/08/09/how-to-remove-overscan-on-hdmi-1080p-output/
# xrandr --output HDMI1 --set audio force-dvi --mode 1920x1080 &

emacs --daemon &
wpctl set-volume @DEFAULT_AUDIO_SINK@ 50 &

dbus-launch ssh-agent &

echo "no" > $HOME/.cache/wmExit

while true
do
	wmExit=$(cat $HOME/.cache/wmExit)
	if [ $wmExit = "yes" ]
	then
		exit
	else
         slstatus &
         feh --bg-max ~/pictures/wallpaper/current &
         notify-send "remember to blink, boys" &
         exec dbus-run-session dwm ;
	fi
done >/dev/null 2>&1
