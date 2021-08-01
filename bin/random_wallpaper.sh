#!/bin/dash
/bin/ls $HOME/Pictures/Wallpapers/* | shuf | tail -n 2 | xargs feh --bg-fill
