#!/bin/sh

export PATH=$HOME/.local/bin:$HOME/bin:$PATH
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
