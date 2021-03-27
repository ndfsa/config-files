##############
##  PROMPT  ##
##############

setopt prompt_subst                                                             # subject prompt to parameter expansion, command substitution and arithmetic expansion
### Git tab completion and VCS info in prompt
autoload -Uz vcs_info

precmd_vcs_info() {
    # only perform if the directory in question is a git repository
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
        vcs_info
    else
        vcs_info_msg_0_=""
    fi
}

precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' enable git   
zstyle ':vcs_info:git:*' stagedstr ' %F{green}%f' 
zstyle ':vcs_info:git:*' unstagedstr ' %F{yellow}%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' שׂ %F{magenta}(%b%f%c%u%m%F{magenta})%f'

+vi-git-untracked() {
  if git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]=' %F{red}%f'
  fi
}


### Fancy prompt
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
        PS1='[%F{yellow}%?%f] %F{yellow}%~%f${vcs_info_msg_0_} %F{blue}>%f '
        ;;
    *)
        PS1='%F{green}%n@%m%f:%~%(!.#.$) '
        ;;
esac
