##############
##  PROMPT  ##
##############

setopt prompt_subst                                                             # subject prompt to parameter expansion, command substitution and arithmetic expansion

precmd_vcs_info() {
    # only perform if the directory in question is a git repository
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
        sts=$(git status --porcelain=1)
        if [[ $(echo "$sts" | rg "^[AMD]") ]]; then
            staged=" %F{green}%f"
        else
            staged=""
        fi
        if [[ $(echo "$sts" | rg "^\\s[MD]") ]]; then
            unstaged=" %F{yellow}%f"
        else
            unstaged=""
        fi
        if [[ $(echo "$sts" | rg "^\\?\\?") ]]; then
            untracked=" %F{red}%f"
        else
            untracked=""
        fi
        vcs_wrapper="%F{magenta} שׂ $(git branch --show-current)%f$staged$unstaged$untracked"
    else
        vcs_wrapper=""
    fi
}

precmd_functions+=( precmd_vcs_info )

### Fancy prompt
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st*|konsole*)
        PS1='[%F{yellow}%?%f] %F{yellow}%~%f${vcs_wrapper} %F{blue}>%f '
        ;;
    *)
        PS1='%F{green}%n@%m%f:%~%(!.#.$) '
        ;;
esac
