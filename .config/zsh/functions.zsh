# Add sudo to the start of the command
sudo-command() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="nvim ${LBUFFER#sudoedit }"
    elif [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == nvim\ * ]]; then
        LBUFFER="sudoedit ${LBUFFER#nvim }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}

zle -N sudo-command

swap-command() {
    if [[ $BUFFER == ls\ * ]]; then
        LBUFFER="bat ${LBUFFER#ls }"
    elif [[ $BUFFER == bat\ * ]]; then
        LBUFFER="ls ${LBUFFER#bat }"
    elif [[ $BUFFER == cp\ * ]]; then
        LBUFFER="mv ${LBUFFER#cp }"
    elif [[ $BUFFER == mv\ * ]]; then
        LBUFFER="cp ${LBUFFER#mv }"
    elif [[ $BUFFER == touch\ * ]]; then
        LBUFFER="mkdir ${LBUFFER#touch }"
    elif [[ $BUFFER == mkdir\ * ]]; then
        LBUFFER="touch ${LBUFFER#mkdir }"
    fi
}

zle -N swap-command
