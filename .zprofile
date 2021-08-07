#!/bin/zsh

export PATH=$HOME/.local/bin:$HOME/bin:$PATH

select opt in gui tty
do
	case $opt in
		tty)
			exec screen
			break
			;;
		gui)
			if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
				exec startx
			else
				echo "Unable to start graphical environment, starting tty."
			fi
			break
			;;
		*) echo "ERROR: Invalid selection"
			;;
	esac
done
