#!/bin/dash

pamixer --allow-boost --set-limit=150 $@ > /dev/null

msgTag="system_volume"
volume=$(pamixer --get-volume)
icon=$HOME/.config/dunst/

if [ $(pamixer --get-mute) = 'true' ]; then
    icon="${icon}volume-mute.png"
    dunstify -a "changeVolume" -u low -i $icon -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:"$volume" "Volume: mute"
else
    if [ $volume -ge 80 ]; then
        icon="${icon}volume-high.png"
    elif [ $volume -ge 50 ]; then
        icon="${icon}volume-med.png"
    elif [ $volume -ge 5 ]; then
        icon="${icon}volume-low.png"
    else
        icon="${icon}volume-none.png"
    fi

    dunstify -a "changeVolume" -u low -i $icon -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:"$volume" "Volume: ${volume}%"
fi
