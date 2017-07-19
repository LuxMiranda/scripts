# Turns your wallpaper into a live-STREAM of USU's Old Main.
# Requires VLC.

#!/bin/bash
if (( $# == 1 )); then
  STREAM=$1
else
  echo "1: old main"
  echo "2: cache valley"
  read STREAM
fi

echo $STREAM

case "$STREAM" in
  "1") # Old Main
    vlc --video-wallpaper --zoom 2 --no-osd --qt-start-minimized --qt-notification 0 --qt-system-tray https://wowza.ser321.usu.edu:443/live/smil:oldmain.smil/playlist.m3u8
    ;;
  "2") # Cache Valley
    vlc --video-wallpaper --zoom 2 --no-osd --qt-start-minimized --qt-notification 0 --qt-system-tray https://wowza.ser321.usu.edu:443/live/prm_720p.stream/playlist.m3u8
    ;;
esac
