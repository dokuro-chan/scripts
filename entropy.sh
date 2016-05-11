#!/bin/sh

# save as entropy.sh and add the following alias to your .bashrc
# alias entrop='sh /path/to/entropy.sh'

entropy=$(cat /proc/sys/kernel/random/entropy_avail)

echo "Available entropy: $entropy"
