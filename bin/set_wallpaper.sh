#!/bin/dash

if [ -s "$HOME/.fehbg" ]; then
    $HOME/.fehbg
else
    $HOME/bin/random_wallpaper
fi
