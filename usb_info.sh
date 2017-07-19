#!/bin/sh

# Gives the name of a recently plugged in USB device

NAME=$(dmesg | tail | grep "] Mode" | cut -d']' -f2 | cut -d "[" -f 2 | tr -d '\n')
echo "Your USB device's name is: /dev/$NAME"
