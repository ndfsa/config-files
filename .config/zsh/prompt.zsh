setopt prompt_subst

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

case ${TERM} in
    xterm*|rxvt*|gnome*|alacritty|st*|konsole*)
		PS1=' %F{3}%~%f${vcs_wrapper} %F{4}>%f '
		PS2=' %F{6}%_ >%f '
		PS3=' %F{6}? >%f '
		PS4=' %F{1}%N%f:%F{5}%i%f -> '
		;;
    *)
		PS1='%F{1}%n%f@%F{2}%m%f:%~ > ';;
esac
