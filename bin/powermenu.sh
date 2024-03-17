#!/bin/dash

lockscreen=' Lock screen'
logout=' Log Out'
suspend='⏾ Suspend'
reboot=' Reboot'
shutdown=' Shut down'

yes=' Yes'
no=' No'

confirm() {
    if [ "$(echo "$no\n$yes" | rofi -dmenu -p "Sure?")" = "$yes" ]; then
        eval "$1"
    fi
}

logout() {
    if [ -n "$(pgrep bspwm)" ]; then
        bspc quit
    fi
}

case $(echo "$lockscreen\n$logout\n$suspend\n$reboot\n$shutdown" | rofi -dmenu -p "Power") in
    $lockscreen) sleep 0.3 && loginctl lock-session;;
    $suspend) confirm "systemctl suspend";;
    $reboot) confirm "systemctl reboot";;
    $shutdown) confirm "systemctl poweroff";;
    $logout) confirm "logout";;
esac
