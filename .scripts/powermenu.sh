#!/bin/sh

declare -A texts
texts[lockscreen]="lock screen"
texts[logout]="log out"
texts[suspend]="suspend"
texts[reboot]="reboot"
texts[shutdown]="shut down"

declare -A icons
icons[lockscreen]=""
icons[logout]=""
icons[suspend]="鈴"
icons[reboot]=""
icons[shutdown]=""
icons[cancel]=""
icons[confirm]=""

declare -A messages
for i in "${!texts[@]}"
do
    messages[$i]="${icons[$i]} ${texts[$i]^}"
done

selection="$(echo "$( IFS=$'\n'; echo "${messages[*]}" )" | rofi -p "Power menu" -dmenu)"
if [ ! -z $selection ]
then
    confirm="$(echo -e "${icons[confirm]} Yes\n${icons[cancel]} No\n" | rofi -p "$selection?" -dmenu)"
    case $confirm in
        "${icons[confirm]} Yes")
            case $selection in
                ${messages[lockscreen]})
                    light-locker-command -l
                    ;;
                ${messages[logout]})
                    bspc quit
                    ;;
                ${messages[suspend]})
                    systemctl suspend
                    ;;
                ${messages[reboot]})
                    systemctl reboot
                    ;;
                ${messages[shutdown]})
                    systemctl poweroff
                    ;;
            esac
            ;;
    esac
fi
