#!/bin/sh

# simple script to show album art, requires cover.jpg in dir

album=$(mpc current -f %album%)
artist=$(mpc current -f %artist%)

cover="~/.music/$artist/$album/cover.jpg"

feh -Z -g 100x100+1500+30 -^ $cover
