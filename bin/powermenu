#!/bin/dash

lockscreen=' Lock screen'
suspend='⏾ Suspend'
reboot=' Reboot'
shutdown=' Shut down'

yes=' Yes'
no=' No'

. $HOME/bin/func.sh

case $(rofi_prompt "echo $lockscreen\n$suspend\n$reboot\n$shutdown" "Power") in
	$lockscreen) sleep 0.3; slock;;
	$shutdown) confirm "$no" "$yes" "exec systemctl poweroff";;
	$reboot) confirm "$no" "$yes" "exec systemctl reboot";;
	$suspend) confirm "$no" "$yes" "exec systemctl suspend";;
esac
