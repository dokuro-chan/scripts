#!/usr/bin/python

# simple color palette generator

# good for themeing/color schemes

# make sure you have the 'colorthief' module installed
# save this as /usr/bin/colorpal
# make script executable

# usage: colorpal <path/to/image>

import sys
from colorthief import ColorThief

cf = ColorThief(sys.argv[1])
p = cf.get_palette()

for c in p:
   print('#%02x%02x%02x' % c)

