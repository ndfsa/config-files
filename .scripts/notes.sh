#!/bin/dash

now="$(date +'%H:%M')"
today="$(date +'%F')"

if [ ! -f ~/Documents/notes/note-"$today".md ]; then
    printf "# Notes for today, $today" > ~/Documents/notes/note-"$today".md
fi

nvim -c "norm Go" \
  -c "norm Go## $now" \
  -c "norm Go" \
  -c "norm zz" \
  -c "startinsert" ~/Documents/notes/note-"$today".md
