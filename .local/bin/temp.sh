#!/bin/sh
temp=$(sensors | awk '/Core/ {print $3}')
echo $temp
