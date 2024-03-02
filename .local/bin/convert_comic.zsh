#!/bin/zsh

[[ -z $1 ]] && printf "no arguments" && exit

zip -9 -r "$(printf "%s.cbz\n" $1)" $1
