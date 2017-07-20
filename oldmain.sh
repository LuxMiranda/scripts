# Turns your wallpaper into a live-STREAM of USU's Old Main.
# Requires VLC.

#!/bin/bash

NC='\033[0m' # No Color
GREEN='\033[0;32m'
RED='\033[0;31m'

if (( $# == 1 )); then
  STREAM=$1
else
  echo -e "${GREEN}[ Choose a live feed ]${NC}"
  echo "1: Old Main"
  echo "2: Cache Valley"
  read -rsn1 STREAM
fi

case "$STREAM" in
  "1") # Old Main
    vlc --video-wallpaper --zoom 2 --no-osd --qt-start-minimized --qt-notification 0 --qt-system-tray https://wowza.ser321.usu.edu:443/live/smil:oldmain.smil/playlist.m3u8
    ;;
  "2") # Cache Valley
    vlc --video-wallpaper --zoom 2 --no-osd --qt-start-minimized --qt-notification 0 --qt-system-tray https://wowza.ser321.usu.edu:443/live/prm_720p.stream/playlist.m3u8
    ;;
  *)
    echo -e "${RED} Not a valid option${NC}"
    ;;
esac
