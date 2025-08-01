#!/bin/sh
sensors $1 | awk '/^temp1/ {print $2}' | sed 's/+//'
