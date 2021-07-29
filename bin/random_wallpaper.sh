#!/bin/dash
file=$(ls $HOME/Pictures/Wallpapers | sort -R | tail -n 1)
feh --bg-fill "$HOME/Pictures/Wallpapers/$file"
