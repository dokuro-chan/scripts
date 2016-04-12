#!/bin/sh

ls | cat -n | while read n f; do mv "$f" "$1-$n.png"; done
