#!/bin/sh

# lol a shitty shell script to make it easier
# for me to decrypt files with openssl aes

# here are a list of ciphers you can use
# aes-128-cbc
# aes-128-ecb
# aes-192-cbc
# aes-192-ecb
# aes-256-cbc
# aes-256-ecb

# usage: aes <file to decrypt> <output file for decrypted content>
# example: aes ayy.enc ayy.txt

openssl aes-256-cbc -d -in $1 -out $2 -a

# -d is decrypt option
# -in is the input file
# $1 is argument one/file to decrypt
# -out is the output file
# $2 is argument 2/file to output decrypted content to

