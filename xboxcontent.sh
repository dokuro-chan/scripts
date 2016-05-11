#!/bin/sh

# simple ass xbox storage/memory device/usb mounter + other shit

# change the -U flag to your storage device's UUID
# get your usb/storage device's uuid with "lsblk -f"

# $USER is already defined on most linux distros
xdir="/mnt/xboxcontent" # mount point
uuid="20B1-7657" # storage device uuid
mcla="$xdir/Content/E8E946F9D591820D/545407F8/00000001/mc4.sav"

case $1 in
   mount) # mount storage device/usb filesystem
      sudo mkdir $xdir
      sudo chown -R $USER $xdir
      sudo mount -U $uuid $xdir
      ;;
   unmount)
      sudo umount -f $xdir
      sudo rm -rf $xdir
      ;;
   backup) # assuming you have already mounted
      cp -R $xdir ~/ # backup filesystem
      ;;
   copy)
      cp $mcla ~/ # copy mcla gamesave
      ;;
   *)
      echo "usage: xcontent [ mount | unmount | backup | copy ]"
      ;;
esac
