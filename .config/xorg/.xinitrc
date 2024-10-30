#!/bin/sh
export PATH="${PATH}:${HOME}/.bashrc" &

/usr/bin/syncthing serve --no-browser --logfile=default &
/usr/libexec/geoclue-2.0/demos/agent &
/usr/libexec/at-spi-bus-launcher --launch-immediately &
redshift -O3500 &

autostart="remaps bgset compton dunst unclutter sxhkd pipewire bluetoothd system-config-printer-applet"

for program in $autostart; do
	pidof -sx "$program" || "$program" &
done >/dev/null 2>&1

# Activate dbus variables
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --verbose --all DISPLAY XAUTHORITY

while true; do
    slstatus &
    xrdb $HOME/.Xresources &
    dbus-launch dwm
    notify-send "remember to blink, boys"
done >/dev/null 2>&1
