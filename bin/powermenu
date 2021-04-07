#!/bin/dash

lockscreen="  Lock screen"
logout="  Log out"
suspend="鈴  Suspend"
reboot="  Reboot"
shutdown="  Shut down"

selection="$(printf "%b" "$lockscreen\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -p "Power menu" -dmenu)"
if [ ! -z "$selection" ]
then
    confirm="$(printf "%b" "  Yes\n  No\n" | rofi -p "$selection?" -dmenu)"
    case $confirm in
        "  Yes")
            case $selection in
                $lockscreen)
                    light-locker-command -l
                    ;;
                $logout)
                    bspc quit
                    ;;
                $suspend)
                    systemctl suspend
                    ;;
                $reboot)
                    systemctl reboot
                    ;;
                $shutdown)
                    systemctl poweroff
                    ;;
            esac
            ;;
    esac
fi
