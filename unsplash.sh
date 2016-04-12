#!/bin/sh

# set random wallpaper from unsplash as wallpaper

wget -O /tmp/wallpaper 'https://unsplash.it/1366/768?random' >/dev/null
feh --bg-fill /tmp/wallpaper
