#!/bin/sh

# simple directory encryption
# add the below alias to your .bashrc
# alias direnc='sh /path/to/this/script.sh'

# usage: direnc <directory to encrypt>
# example: direnc unencrypted

# - full example output below -

# Starting 3 stage directory encryption (test)...
# enter aes-256-cbc encryption password:
# Verifying - enter aes-256-cbc encryption password:
# Stage 1 successfull: test.tar.enc
# enter des-ede3-cbc encryption password:
# Verifying - enter des-ede3-cbc encryption password:
# Stage 2 successfull: test.tar.des3
# Stage 3 successfull: test.tgz.gpg

echo "Starting 3 stage directory encryption ($1)..."

# stage 1 - openssl aes-256-cbc
tar c $1 | openssl enc -aes-256-cbc -e > "$1.tar.enc"
echo "Stage 1 successfull: $1.tar.enc"

# stage 2 - openssl des3
openssl des3 -salt -in "$1.tar.enc" -out "$1.tar.des3"
echo "Stage 2 successfull: $1.tar.des3"

# stage 3 - gpg aes
tar zcf - "$1.tar.des3" | gpg -c --cipher-algo aes256 -o "$1.tgz.gpg"
echo "Stage 3 successfull: $1.tgz.gpg"

# clean up
echo "Cleaning up"
rm -rf "$1.tar.enc" && rm -rf "$1.tar.des3"
