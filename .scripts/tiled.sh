#!/bin/dash
bspc query -N -d focused -n ".$1" -n ".floating" | xargs -I{} bspc node {} -t "$2"
