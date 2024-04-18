#!/bin/sh

redshift-gtk -t 5500:5500 &
wal -R &
dunst &

exec dwm
