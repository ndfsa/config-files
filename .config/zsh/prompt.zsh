setopt prompt_subst

set_mode(){
	case $1 in
		vicmd) vi_mode='%F{1}>%f';;
		viins|main) vi_mode='%F{4}>%f';;
		*) vi_mode='%F{4}>%f'
	esac
}

precmd_vcs_info() {
    vcs_wrapper=""
    [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != true ]] && return
	sts=$(git status --porcelain=1 2> /dev/null)
	staged=""
	unstaged=""
	untracked=""
	[[ -n $(echo "$sts" | rg "^[AMD]") ]] && staged=" %F{2}%f"
	[[ -n $(echo "$sts" | rg "^\\s[MD]") ]] && unstaged=" %F{3}%f"
	[[ -n $(echo "$sts" | rg "^\\?\\?") ]] && untracked=" %F{1}%f"

	branch=$(git branch --show-current 2> /dev/null)
	if [[ -n $branch ]]; then
		branch="%F{5} שׂ $branch%f"
	else
		branch=$(git describe --tags --exact-match 2> /dev/null)
		if [[ $branch ]]; then
			branch="%F{5}  $branch%f"
		else
			branch="%F{5}  $(git rev-parse --short HEAD 2> /dev/null)%f"
		fi
	fi
	vcs_wrapper="$branch$staged$unstaged$untracked"
}

precmd_functions+=( precmd_vcs_info )
precmd_functions+=( set_mode main )

case ${TERM} in
    xterm*|rxvt*|gnome*|alacritty|st*|konsole*)
		PS1=' %F{3}%~%f${vcs_wrapper} ${vi_mode} ';;
    *)
		PS1='%F{1}%n%f@%F{2}%m%f:%~ ${vi_mode} ';;
esac
