###################
##   KEYBINDS    ##
###################

autoload -Uz zkbd
if [[ -f ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE} ]]; then
    source ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}
else
    echo "WARNING: Keybindings may not be set correctly!"
    echo "Execute \`zkbd\` to create bindings."
fi
bindkey -e

## Add sudo to the start of the command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}

zle -N sudo-command-line

## History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# setup key accordingly
[[ -n "${key[Home]}"        ]] && bindkey -- "${key[Home]}"           beginning-of-line
[[ -n "${key[End]}"         ]] && bindkey -- "${key[End]}"            end-of-line
[[ -n "${key[Insert]}"      ]] && bindkey -- "${key[Insert]}"         overwrite-mode
[[ -n "${key[Backspace]}"   ]] && bindkey -- "${key[Backspace]}"      backward-delete-char
[[ -n "${key[Delete]}"      ]] && bindkey -- "${key[Delete]}"         delete-char
[[ -n "${key[Up]}"          ]] && bindkey -- "${key[Up]}"             up-line-or-beginning-search
[[ -n "${key[Down]}"        ]] && bindkey -- "${key[Down]}"           down-line-or-beginning-search
[[ -n "${key[Left]}"        ]] && bindkey -- "${key[Left]}"           backward-char
[[ -n "${key[Right]}"       ]] && bindkey -- "${key[Right]}"          forward-char
[[ -n "${key[PageUp]}"      ]] && bindkey -- "${key[PageUp]}"         beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"    ]] && bindkey -- "${key[PageDown]}"       end-of-buffer-or-history
[[ -n "${key[S-Tab]}"       ]] && bindkey -- "${key[S-Tab]}"          reverse-menu-complete
[[ -n "${key[C-Left]}"      ]] && bindkey -- "${key[C-Left]}"         backward-word 
[[ -n "${key[C-Right]}"     ]] && bindkey -- "${key[C-Right]}"        forward-word 
[[ -n "${key[C-Backspace]}" ]] && bindkey -- "${key[C-Backspace]}"    backward-kill-word
[[ -n "${key[C-Delete]}"    ]] && bindkey -- "${key[C-Delete]}"       kill-word
[[ -n "${key[A-s]}"         ]] && bindkey -- "${key[A-s]}"            sudo-command-line
[[ -n "${key[C-i]}"         ]] && bindkey -- "${key[C-i]}"            fzf_completion
