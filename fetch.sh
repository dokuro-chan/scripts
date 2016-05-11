#!/bin/sh

# my version of screenfetch 

USER=$(whoami)
HOST=$(uname -n)
OS="arch linux"
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed s:"up "::)
PACKAGES=$(pacman -Q | wc -l)
ENTROPY=$(cat /proc/sys/kernel/random/entropy_avail)
INIT="openrc/custom"
FONT="terminus 9"

c0=$(tput setaf 0)
c1=$(tput setaf 1)
c2=$(tput setaf 2)
c3=$(tput setaf 3)
c4=$(tput setaf 4)
c5=$(tput setaf 5)
c6=$(tput setaf 6)
c7=$(tput setaf 7)

rc=$(tput sgr0)
lc=${c6}
nc=${c6}
tc=${c7}

cat <<EOF

${lc}        .___.        ${USER}${rc}${tc}@${rc}${nc}${HOST}${rc}
${lc}       /     \       packages:${rc} ${tc}${PACKAGES}${rc}
${lc}      | O _ O |      entropy:${rc} ${tc}${ENTROPY}${rc}
${lc}      /  \_/  \\      shell:${rc} ${tc}${SHELL}${rc}
${lc}    .' /     \ \`.    font:${rc} ${tc}${FONT}${rc}
${lc}   / _|       |_ \\   distro:${rc} ${tc}${OS}${rc}
${lc}  (_/ |       | \_)  rc/init:${rc} ${tc}${INIT}${rc}
${lc}      \       /      kernel:${rc} ${tc}${KERNEL}${rc}
${lc}     __\_>-<_/__     uptime:${rc} ${tc}${UPTIME}${rc}
${lc}     ~;/     \;~

EOF
