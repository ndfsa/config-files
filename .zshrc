# profiling for performance
#zmodload zsh/zprof

# colors
autoload -U colors && colors
export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
export BAT_THEME='gruvbox-dark'
WORDCHARS='~!#$%^&*(){}[]<>?.+;-'


### set extended globs, may conflict with valid filenames, remember to look out
setopt extended_glob


### Enable history and history cache, move to cache file in home
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTCONTROL=ignoreboth
setopt hist_ignore_dups     # ignore dups in history


### Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'	# tab completition is case insensitive
zstyle ':completion:*:default' list-colors \ 
       ${(s.:.)LS_COLORS}
zmodload zsh/complist
setopt nomenucomplete


##############
##  PROMPT  ##
##############
setopt prompt_subst         # subject prompt to parameter expansion, command substitution and arithmetic expansion
### Git tab completition and VCS info in prompt
autoload -Uz compinit && compinit
autoload -Uz vcs_info

precmd_vcs_info() {
    # only perform if the directory in question is a git repository
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]
    then
        vcs_info
    else
        vcs_info_msg_0_=""
    fi
}
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' enable git   
zstyle ':vcs_info:git:*' stagedstr ' %F{green}%f' 
zstyle ':vcs_info:git:*' unstagedstr ' %F{yellow}%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats 'שׂ %F{magenta}(%b%f%c%u%m%F{magenta})%f '

+vi-git-untracked() {
  if git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]=' %F{red}%f'
  fi
}


### Fancy prompt
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
        PS1='%F{blue}%n%f@%m %F{yellow}%~%f%F{green}>%f '
        RPS1='${vcs_info_msg_0_}[%F{yellow}%?%f]'
        ;;
    *)
        PS1='%F{green}%n@%m%f:%~%(!.#.$) '
        ;;
esac


###################
##  WINDOW TITLE  #
###################
case $TERM in
    *xterm*|alacritty|kitty|rxvt*)
        precmd () { print -Pn "\e]0;%n@%M %~\a" } 
        preexec () { print -Pn "\e]0;%n@%M %~ ($1)\a" }
        ;;
    screen|screen-256color)
        precmd () { 
            print -Pn "\e]83;title \"$1\"\a" 
            print -Pn "\e]0;$TERM - (%L) %n@%M %~\a" 
        }
        preexec () { 
            print -Pn "\e]83;title \"$1\"\a" 
            print -Pn "\e]0;$TERM - (%L) %n@%M %~ ($1)\a" 
        }
        ;; 
esac


### History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search


### Enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias vim='nvim'
alias ls='exa -al'
alias top='bpytop'

### Useful keybinds
autoload -Uz zkbd
if [[ -f ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE} ]]; then
    source ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}
else
    echo "WARNING: Keybindings may not be set correctly!"
    echo "Execute \`zkbd\` to create bindings."
fi
bindkey -e

# setup key accordingly
[[ -n "${key[Home]}"              ]] && bindkey -- "${key[Home]}"                   beginning-of-line
[[ -n "${key[End]}"               ]] && bindkey -- "${key[End]}"                    end-of-line
[[ -n "${key[Insert]}"            ]] && bindkey -- "${key[Insert]}"                 overwrite-mode
[[ -n "${key[Backspace]}"         ]] && bindkey -- "${key[Backspace]}"              backward-delete-char
[[ -n "${key[Delete]}"            ]] && bindkey -- "${key[Delete]}"                 delete-char
[[ -n "${key[Up]}"                ]] && bindkey -- "${key[Up]}"                     up-line-or-beginning-search
[[ -n "${key[Down]}"              ]] && bindkey -- "${key[Down]}"                   down-line-or-beginning-search
[[ -n "${key[Left]}"              ]] && bindkey -- "${key[Left]}"                   backward-char
[[ -n "${key[Right]}"             ]] && bindkey -- "${key[Right]}"                  forward-char
[[ -n "${key[PageUp]}"            ]] && bindkey -- "${key[PageUp]}"                 beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"          ]] && bindkey -- "${key[PageDown]}"               end-of-buffer-or-history
[[ -n "${key[S-Tab]}"             ]] && bindkey -- "${key[S-Tab]}"                  reverse-menu-complete

[[ -n "${key[C-Left]}"              ]] && bindkey -- "${key[C-Left]}"                 backward-word 
[[ -n "${key[C-Right]}"             ]] && bindkey -- "${key[C-Right]}"                forward-word 
[[ -n "${key[C-Backspace]}"         ]] && bindkey -- "${key[C-Backspace]}"            backward-kill-word


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# profiling
#zprof
