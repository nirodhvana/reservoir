#!/bin/sh
export PATH="${PATH}:${HOME}/.bashrc" &

/usr/bin/syncthing serve --no-browser --logfile=default &
/usr/libexec/geoclue-2.0/demos/agent &
/usr/libexec/at-spi-bus-launcher --launch-immediately &
xrdb $HOME/.Xresources &
pamixer --set-volume 100 &
redshift -O 3500 &

autostart="remaps picom dunst unclutter sxhkd bluetoothd pipewire pipewire-pulse ipp-usb cupsd avahi-daemon"

for program in $autostart; do
	pidof -sx "$program" || "$program" &
done >/dev/null 2>&1

# Activate dbus variables
systemctl --user import-environment DISPLAY XAUTHORITY
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval $(/usr/bin/dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment --verbose --all DISPLAY XAUTHORITY
systemctl --user --now enable pipewire pipewire-pulse

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
