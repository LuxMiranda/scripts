#!/usr/bin/env bash

NC='\033[0m' # No Color
GREEN='\033[0;32m'
RED='\033[0;31m'

if (( $# == 1 )); then
  EMAIL=$1
else
  echo -e "${RED}Enter email as first argument${NC}"
  exit
fi

ssh-keygen -t rsa -b 4096 -C $EMAIL

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

if hash xclip 2>/dev/null; then
  echo -e "${GREEN}SSH Key coppied to clipboard${NC}"
  xclip -selection c < ~/.ssh/id_rsa.pub
  echo -e "${GREEN}[DONE]${NC}"
  exit
else
  echo -e "${RED}xclip not installed${NC}"
  echo -e "${GREEN}Coppy key from terminal${NC}"
  cat ~/.ssh/id_rsa.pub
  echo -e "${GREEN}[DONE]${NC}"
  exit
fi

exit
