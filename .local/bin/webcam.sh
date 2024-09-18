#!/bin/bash
pkill -f /dev/video0 || mpv --no-osc --autofit=30% --no-input-default-bindings --input-conf=/dev/null /dev/video0
