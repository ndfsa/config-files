#!/bin/dash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
$user_id=$(id-ru)
while pgrep -u $user_id -x polybar >/dev/null; do sleep 0.3; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini &
