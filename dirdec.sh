#!/bin/sh

# use parallel with 'direnc.sh'

# add the below alias to your .bashrc
# alias dirdec='sh /path/to/this/script.sh'

# usage: dirdec <stage 3 gpg file without the .tgz.gpg extension>
# example: dirdec test
# bad usage: dirdec test.tgz.gpg

# - full example output below -

# gpg: AES256 encrypted data
# gpg: encrypted with 1 passphrase
# test.tar.des3
# Stage 3 gpg decryption successfull: test.tar.des3
# enter des-ede3-cbc decryption password:
# Stage 2 des3 decryption successfull: test.tar.enc
# enter aes-256-cbc decryption password:
# Stage 1 aes decryption successfull: test

# stage 3 - gpg decryption
gpg -o- "$1.tgz.gpg" | tar zxvf -
echo "Stage 3 gpg decryption successfull: $1.tar.des3"

# stage 2 - des3 decryption
openssl des3 -d -salt -in "$1.tar.des3" -out "$1.tar.enc"
echo "Stage 2 des3 decryption successfull: $1.tar.enc"

# stage 1 - aes-256-cbc decryption
openssl enc -aes-256-cbc -d < "$1.tar.enc" | tar x
echo "Stage 1 aes decryption successfull: $1"

# clean up
echo "Cleaning up..."
rm -rf "$1.tar.enc" && rm -rf "$1.tar.des" && rm -rf "$1.tgz.gpg"
