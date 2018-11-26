#!/usr/bin/env bash

# Backup the current mirror list
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# rank the mirrors
sudo rankmirrors -f 0
