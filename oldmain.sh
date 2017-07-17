# Turns your wallpaper into a live-stream of USU's Old Main.
# Requires VLC.

#!/bin/bash
vlc --video-wallpaper --zoom 2 --no-osd --qt-start-minimized --qt-notification 0 --qt-system-tray https://wowza.ser321.usu.edu:443/live/smil:oldmain.smil/playlist.m3u8
