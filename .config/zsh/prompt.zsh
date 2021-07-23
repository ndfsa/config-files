##############
##  PROMPT  ##
##############

setopt prompt_subst                                                             # subject prompt to parameter expansion, command substitution and arithmetic expansion

precmd_vcs_info() {
    # only perform if the directory in question is a git repository
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
        sts=$(git status --porcelain=1)
        if [[ -n $(echo "$sts" | rg "^[AMD]") ]]; then
            staged=" %F{2}%f"
        else
            staged=""
        fi
        if [[ -n $(echo "$sts" | rg "^\\s[MD]") ]]; then
            unstaged=" %F{3}%f"
        else
            unstaged=""
        fi
        if [[ -n $(echo "$sts" | rg "^\\?\\?") ]]; then
            untracked=" %F{1}%f"
        else
            untracked=""
        fi
        branch=$(git branch --show-current)
        if [[ -n $branch ]]; then
            branch="%F{5} שׂ $branch%f"
        else
			branch=$(git describe --tags --exact-match 2> /dev/null)
			if [[ $branch ]]; then
				branch="%F{5}  $branch%f"
			else
				branch="%F{5}  $(git rev-parse --short HEAD)%f"
			fi
        fi
        vcs_wrapper="$branch$staged$unstaged$untracked"
    else
        vcs_wrapper=""
    fi
}

precmd_functions+=( precmd_vcs_info )

### Fancy prompt
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st*|konsole*)
        PS1=' %F{3}%~%f${vcs_wrapper} %F{4}Ⲗ%f '
        ;;
    *)
        PS1='%F{1}%n%f@%F{2}%m%f:%~%(!.#.$) '
        ;;
esac
