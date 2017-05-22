#!/bin/sh

NAME=$(dmesg | tail | grep "] Mode" | cut -d']' -f2 | cut -d "[" -f 2 | tr -d '\n')
echo "Your USB device's name is: /dev/$NAME"
