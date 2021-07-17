export EDITOR=nvim
export BAT_THEME='gruvbox-dark'
export PAGER='bat'
export BROWSER=firefox
export LS_COLORS='di=1;34:ln=36:so=1;31:pi=33:ex=1;32:bd=1;33:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

LF_ICONS=$(sed ~/.config/lf/icons	\
            -e '/^[ \t]*#/d'		\
            -e '/^[ \t]*$/d'		\
            -e 's/[ \t]\+/=/g'		\
            -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS
