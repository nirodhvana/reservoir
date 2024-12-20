#!/bin/sh
export PATH="${PATH}:${HOME}/.bashrc" &

/usr/bin/syncthing serve --no-browser --logfile=default &
/usr/libexec/geoclue-2.0/demos/agent &
/usr/libexec/at-spi-bus-launcher --launch-immediately &
pamixer --set-volume 100 &
redshift -O 3500 &

autostart="remaps bgset picom dunst unclutter sxhkd bluetoothd pipewire pipewire-pulse cupsd avahi-daemon"

for program in $autostart; do
	pidof -sx "$program" || "$program" &
done >/dev/null 2>&1

# Activate dbus variables
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --verbose --all DISPLAY XAUTHORITY

systemctl --user --now enable pipewire pipewire-pulse wireplumber

while true; do
    slstatus &
    xrdb $HOME/.Xresources &
    dbus-launch dwm
    notify-send "remember to blink, boys"
done >/dev/null 2>&1
