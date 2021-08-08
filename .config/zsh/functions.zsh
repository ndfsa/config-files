## Add sudo to the start of the command
sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	if [[ $BUFFER == sudo\ * ]]; then
		LBUFFER="${LBUFFER#sudo }"
	elif [[ $BUFFER == sudoedit\ * ]]; then
		LBUFFER="vim ${LBUFFER#sudoedit }"
	elif [[ $BUFFER == vim\ * ]]; then
		LBUFFER="sudoedit ${LBUFFER#vim }"
	else
		LBUFFER="sudo $LBUFFER"
	fi
}

zle -N sudo-command-line
