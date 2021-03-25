#!/bin/dash

# Terminate already running bar instances
killall -q picom

# Wait until the processes have been shut down
$user_id=$(id-ru)
while pgrep -u $user_id -x picom >/dev/null; do sleep 0.5; done

# Launch the bar
picom --experimental-backends --config "$HOME/.config/picom/picom.conf" &
