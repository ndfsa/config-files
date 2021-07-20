#!/bin/dash

case $1 in
    up) pamixer -i 2;;
    down) pamixer -d 2;;
    mute) pamixer -t;;
    get)
        if [ `pamixer --get-mute` = "false" ]; then
            echo "`pamixer --get-volume`%"
        else
            echo "M"
        fi
        ;;
esac
