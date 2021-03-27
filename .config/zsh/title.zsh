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
