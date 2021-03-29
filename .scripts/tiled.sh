#!/bin/dash
bspc query -N -d focused -n ".$1" | xargs -I{} bspc node {} -t "$2"
