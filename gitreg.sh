#!/bin/sh

git clone $1

git init
git add .
git commit -m "First commit"

git remote add origin $1
git remote -v

git push origin master
