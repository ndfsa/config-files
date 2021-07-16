###################
##  WINDOW TITLE  #
###################

case $TERM in
    *xterm*|alacritty|kitty|st*|rxvt*)
        precmd () {
            printf "\e]0;%s\a" `pwd`
        }
        preexec () {
            printf "\e]0;%s\a" "`pwd` $1"
        }
        ;;
esac
