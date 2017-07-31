#!/usr/bin/bash

if hash pacman 2>/dev/null; then
  sudo pacman -Syyu
  sudo pacman-optimize && sync
  exit
fi

if hash apt 2>/dev/null; then
  sudo apt -y update
  sudo apt -y upgrade
  sudo apt -y dist-upgrade
  sudo apt -y autoremove
  sudo apt -y autoclean
  exit
fi
