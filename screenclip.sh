#!/usr/bin/env bash

# get a name for a temporary file
temp="$(mktemp -u).png"

# use scrot to put a screenshot into said temporary file
scrot -s "$temp"

# copy the image to the X clipboard, tagging it as image data 
xclip -selection clipboard -t image/png -i "$temp"

# remove the temporary file
rm -f "$temp"
