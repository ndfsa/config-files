#!/bin/sh

MONITORS=`xrandr -q | rg " connected " | wc -l`

/bin/ls $HOME/Pictures/Wallpapers/* \
    | shuf -n2\
    | xargs feh --bg-fill
