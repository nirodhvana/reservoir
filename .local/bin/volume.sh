#!/bin/sh
vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
if [ $mute == true ]
then
    echo "mute/$vol"
else
    echo "$vol"
fi
