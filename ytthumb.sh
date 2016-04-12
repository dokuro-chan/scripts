#1/bin/sh

# very ugly, down and dirty, youtube thumbnail downloader

wget -q $1 -O /tmp/jewtube && cat /tmp/jewtube | grep "thumbnailUrl" | sed -n "/href/ s/.*href=['\"]\([^'\"]*\).*/\1/gp"
