#!/bin/sh
autostart="pipewire bluetoothd dunst"

for program in $autostart; do
	pidof -sx "$program" || "$program" &
done >/dev/null 2>&1

wpctl set-volume @DEFAULT_SOURCE@ 70
gammastep -O 3500 &
emacs --daemon &
foot --server &
swaybg -i ~/Downloads/44368.jpg &
bash $HOME/.local/bin/updatesch.sh
