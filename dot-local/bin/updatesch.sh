#!/bin/sh
day="$(date '+%A')"
[[ "$day" == "Saturday" || "$day" == "Sunday" ]] && notify-send "UPDATE SCHEDULED TODAY"
