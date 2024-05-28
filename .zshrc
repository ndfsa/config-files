# set env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin"
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME=base16
export PAGER=bat
export BROWSER=chromium
export LS_COLORS='di=1;34:ln=36:so=1;31:pi=33:ex=1;32:bd=1;33:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export MANROFFOPT='-c'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SXHKD_SHELL=dash
export JDTLS_HOME=/usr/share/java/jdtls
export AUR_PAGER=lf
export FZF_DEFAULT_OPTS=--color=16
export DIFFPROG='nvim -d'
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export GHCUP_USE_XDG_DIRS=1

# create CUSTOM_PATHS array
CUSTOM_PATHS=( $XDG_BIN_HOME )
CUSTOM_PATHS+=( "$HOME/.dotfiles/bin" )

# optionally add programs' directories to PATH if their commands are available
if command -v go &> /dev/null
then
    CUSTOM_PATHS+=( "$(go env GOPATH)/bin" )
fi
if command -v cargo &> /dev/null
then
    CUSTOM_PATHS+=( "$CARGO_HOME/bin" )
fi
if command -v npm &> /dev/null
then
    CUSTOM_PATHS+=( "$XDG_DATA_HOME/npm/bin" )
fi
if command -v dotnet &> /dev/null
then
    CUSTOM_PATHS+=( "$HOME/.dotnet/tools" )
fi

# merge PATH and CUSTOM_PATHS
for i in ${CUSTOM_PATHS[@]}
do
    case ":$PATH:" in
        *":$i:"*) ;;
        *) PATH="$i:$PATH";;
    esac
done
unset CUSTOM_PATHS

eval "$(/opt/homebrew/bin/brew shellenv)"

# cache directory
ZCACHES=$XDG_CACHE_HOME/zsh

# history options
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$ZCACHES/history

# history save behavior
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt HIST_VERIFY

# exit if not an interactive shell
[[ $- != *i* ]] && return

# add the completions directory
fpath=($(brew --prefix)/share/zsh-completions $(brew --prefix)/share/zsh/site-functions $fpath)

# menu-select widget
zmodload zsh/complist

# completion system
autoload -Uz compinit
compinit -d $ZCACHES/zcompdump

# set completion menu to select mode
zstyle ':completion:*' menu select

# use verbose completions always
zstyle ':completion:*' verbose yes

# add completer functions in the order in which they will be executed
zstyle ':completion:*' completer _extensions _complete _approximate

# group completions
zstyle ':completion:*' group-name ''

# add description subtitles to categories
zstyle ':completion:*' format '%F{green}-- %d --%f'

# use LS_COLORS for completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# squeeze slashes
zstyle ':completion:*' squeeze-slashes true

# setup completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZCACHES"

# ignore case for completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# always show menu
setopt MENU_COMPLETE

# change directory and run neovim
function __scoped_edit(){
    (cd "$1" && nvim .)
}

# setup aliases
function rm() {
    trash $@
}
alias ls='eza --icons --sort=type --classify=always --group'
alias la='ls -a'
alias lsl='ls -l'
alias lal='lsl -a'
alias ip='ip --color=auto'
function mkcd(){
    mkdir $1 && cd $1
}
alias conf='__scoped_edit $HOME/.dotfiles/'
alias :q='exit' # I'm done with this

# history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# bash-style words
autoload -Uz select-word-style
select-word-style bash

# use terminfo to setup keybinds
bindkey "${terminfo[khome]}" beginning-of-line # home
bindkey "${terminfo[kend]}" end-of-line # end
bindkey "${terminfo[kich1]}" overwrite-mode # insert
bindkey "${terminfo[kbs]}" backward-delete-char # backspace
bindkey "${terminfo[kdch1]}" delete-char # delete
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # up
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search # down
bindkey "${terminfo[kcub1]}" backward-char # left
bindkey "${terminfo[kcuf1]}" forward-char # right
bindkey "${terminfo[kpp]}" beginning-of-buffer-or-history # page up
bindkey "${terminfo[knp]}" end-of-buffer-or-history # page down
bindkey "^[[1;9D" backward-word # control-left
bindkey "^[[1;9C" forward-word # control-right
bindkey '^N' menu-complete
bindkey '^P' reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -r '^['

# make sure zle is in application mode, only then is terminfo valid
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# use zoxide
if command -v zoxide &> /dev/null
then
    # turn off completions for now
    eval "$(zoxide init zsh --cmd cd | sed -n '/# Completion.*/q;p')"
fi

# use starship prompt
if command -v starship &> /dev/null
then
    eval "$(starship init zsh)"
fi

# integrate fzf
if command -v fzf &> /dev/null
then
    # turn off keybinds
    FZF_ALT_C_COMMAND=
    FZF_CTRL_T_COMMAND=
    eval "$(fzf --zsh)"
else
    bindkey '^R' history-incremental-search-backward
fi

# syntax highlighting
PLUGIN=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -e $PLUGIN ]] && source $PLUGIN

# auto-suggestions
PLUGIN=$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -e $PLUGIN ]] && source $PLUGIN

unset PLUGIN
