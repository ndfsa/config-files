#zmodload zsh/complist
#setopt menu_complete
autoload -U compinit && compinit

#zstyle ':completion:*' menu select=1
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	                        # tab completion is case insensitive
#zstyle ':completion:*' verbose yes

source ~/.config/zsh/fzf-zsh-completion.sh
zstyle ':completion:*' fzf-search-display true
zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'
