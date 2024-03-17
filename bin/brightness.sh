#!/bin/dash

xbacklight $@ > /dev/null

msgTag="system_brightness"
brightness=$(xbacklight -get)
icon=$HOME/.config/dunst/brightness.png

dunstify -a "changeBrightness" -u low -i $icon -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$brightness" "Backlight: ${brightness}%"
