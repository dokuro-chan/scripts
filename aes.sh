#!/bin/sh

# lol a shitty shell script to make it easier
# for me to use openssl aes in a simple way

# here are a list of ciphers you can use
# aes-128-cbc
# aes-128-ecb
# aes-192-cbc
# aes-192-ecb
# aes-256-cbc (default)
# aes-256-ecb

# usage: aes <file to encrypt> <name of encrypted file>
# example: aes ayy.txt ayy.enc

openssl aes-256-cbc -in $1 -out $2 -a

# -in is the input file
# $1 is argument one
# -out is the output file
# $2 is argument 2
# -a is to encode with base64
