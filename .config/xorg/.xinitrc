#!/bin/sh
export PATH="${PATH}:${HOME}/.bashrc" &

/usr/bin/syncthing serve --no-browser --logfile=default &
/usr/libexec/geoclue-2.0/demos/agent &
/usr/libexec/at-spi-bus-launcher --launch-immediately &
xrdb $HOME/.Xresources &
pamixer --set-volume 100 &
redshift -O 3500 &

autostart="remaps picom dunst unclutter sxhkd bluetoothd blueman-applet pipewire pipewire-pulse ipp-usb cupsd avahi-daemon"

for program in $autostart; do
	pidof -sx "$program" || "$program" &
done >/dev/null 2>&1

# Activate dbus variables
systemctl --user import-environment DISPLAY XAUTHORITY
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval $(/usr/bin/dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment --verbose --all DISPLAY XAUTHORITY
systemctl --user --now enable pipewire pipewire-pulse bluetoothd

# Fix overscan problem on HDMI TV when underscan isnt available
# Docs: https://www.engadget.com/2010-05-27-hd-101-overscan-and-why-all-tvs-do-it.htm://www.engadget.com/2010-05-27-hd-101-overscan-and-why-all-tvs-do-it.html
# Soln: https://evilshit.wordpress.com/2012/08/09/how-to-remove-overscan-on-hdmi-1080p-output/
xrandr --output HDMI-1 --set audio force-dvi --mode 1920x1080

echo "no" > $HOME/.cache/wmExit

while true
do
	wmExit=$(cat $HOME/.cache/wmExit)
	if [ $wmExit = "yes" ]
	then
		exit
	else
         slstatus &
         feh --bg-max ~/Pictures/wallpaper/current &
         notify-send "remember to blink, boys" &
         dwm ;
	fi
done >/dev/null 2>&1
