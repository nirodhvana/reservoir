#!/bin/sh
wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '/Volume:/ { printf "%d\n", $2 }'
