if [[ -f ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE} ]]; then
    source ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}
else
    autoload -Uz zkbd
    echo "WARNING: Keybindings may not be set correctly!"
    echo "Execute \`zkbd\` to create bindings."
fi
bindkey -e

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
bindkey "^[s" sudo-command-line
