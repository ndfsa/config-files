#!/bin/dash

PLY=`playerctl --list-all`
if [ -n "$PLY" ]; then
    SEL=$(echo "$PLY" | rofi -dmenu -p "Players")
    if [ -n "$SEL" ]; then
        playerctl --player="$SEL" play-pause
    fi
fi

unset PLY
unset SEL
