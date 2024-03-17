#!/bin/bash

# check if the argument is empty
[[ -z "$1" ]] && exit 1

# get the directory filename
file=$(basename "$1")

# check if the directory exists
[[ ! -e "./$file" ]] && exit 2

# convert directory into a comic book file
zip -9 -r "$file.cbz" "./$file"
