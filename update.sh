#!/usr/bin/env bash

set -e

if hash pacaur 2>/dev/null; then
  echo "pacaur -Syu"
  pacaur -Syu
  exit
fi

if hash pacman 2>/dev/null; then
  echo "pacman -Syyu && sync"
  sudo pacman -Syyu
  sudo sync
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
