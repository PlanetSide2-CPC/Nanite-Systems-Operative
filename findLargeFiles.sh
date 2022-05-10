#!/bin/bash

echo -e '\e[0;4;97;48;5;34mThis is a shell script running large files query\e[0m'
echo

# Clearing the IFS to disabled its behavior
IFS= read -rp "Enter a path (can be relative): " filepath

echo
echo -e '\e[0;4mGiven specific filter size [+/-](size)[K/M/G/T]\e[0m'
echo "  Example: +200M (more than 200M)"
echo

IFS= read -rp "Enter filter size: " filesize

echo

exec find "${filepath}" -type f -size "${filesize}" -print0 | xargs -0 du -shc | sort -nr
