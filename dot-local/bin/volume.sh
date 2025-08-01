#!/bin/sh
wpctl get-volume @DEFAULT_SOURCE@ 2>/dev/null | awk '/Volume:/ { printf "%d\n", $2 }'
