#!/bin/dash

# Terminate already running bar instances
killall -q picom

# Wait until the processes have been shut down
while pgrep -u $(id -ru) -x picom >/dev/null; do sleep 0.5; done

# Launch the bar
picom --experimental-backends --config "$HOME/.config/picom/picom.conf" &

$HOME/bin/set_wallpaper.sh
slstatus &
