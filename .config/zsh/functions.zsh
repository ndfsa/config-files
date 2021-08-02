## Add doas to the start of the command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == doas\ * ]]; then
        LBUFFER="${LBUFFER#doas }"
    else
        LBUFFER="doas $LBUFFER"
    fi
}

zle -N sudo-command-line
