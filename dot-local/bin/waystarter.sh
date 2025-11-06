#!/bin/sh
autostart="pipewire bluetoothd dunst"

for program in $autostart; do
	pidof -sx "$program" || "$program" &
done >/dev/null 2>&1

wpctl set-volume @DEFAULT_SOURCE@ 50
gammastep -O 3500 &
emacs --daemon &
foot --server &
swaybg -m fit -i ~/pictures/wallpaper/current &
swayidle timeout 1200 "waylock -ignore-empty-password -init-color 0x2e5d66 -input-color 0x6d8d5f -input-alt-color 0xa5995e -fail-color 0xC9372A" &
/usr/bin/syncthing serve --no-browser --logfile=default &
bash $HOME/.local/bin/updatesch.sh
