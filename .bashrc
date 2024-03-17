source $HOME/.profile
### options
export HISTCONTROL='ignoreboth:erasedups'
export HISTFILESIZE=5000
export HISTSIZE=5000
export HISTFILE="$XDG_DATA_HOME/bash_history"

[[ $- != *i* ]] && return

### Alias
function __scoped_edit(){
    (cd "$1" && nvim .)
}

function rm(){
    trash $@
}

alias ls='eza --icons --sort=type --classify=always --group'
alias la='ls -a'
alias lsl='ls -l'
alias lal='lsl -a'
alias ip='ip --color=auto'
function mkcd(){
    __DIR_NAME=$1
    mkdir $1 && cd $1
}
alias conf='__scoped_edit $HOME/.dotfiles/'
alias book-pull='rclone sync gdrive_crypt:Documents/Books $HOME/Documents/Books -P'
alias book-push='rclone sync $HOME/Documents/Books gdrive_crypt:Documents/Books -P'
alias :q='exit' # I'm done with this

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

eval "$(zoxide init --cmd cd bash)"

if [ $TERM != "linux" ]; then
    eval "$(starship init bash)"
else
    case ${TERM} in
        linux*|screen*)
            PS1=' %F{5}%~%f %F{4}>%f '
            ;;
    esac
fi
