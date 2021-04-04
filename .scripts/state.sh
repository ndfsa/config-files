#/bin/dash
bspc query -N -n .!"$1" | xargs -I\{\} bspc node \{\} -t "$1"
bspc rule -r tail
bspc rule -a "*" state="$1"
