set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_BIN_HOME "$HOME/.local/bin"

set -x EDITOR nvim
set -x VISUAL nvim
set -x BAT_THEME base16
set -x AUR_PAGER lf
set -x PAGER bat
set -x BROWSER chromium
set -x LS_COLORS 'di=1;34:ln=36:so=1;31:pi=33:ex=1;32:bd=1;33:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SXHKD_SHELL dash
set -x JDTLS_HOME /usr/share/java/jdtls
set -x FZF_DEFAULT_OPTS --color=16
set -x DIFFPROG 'nvim -d'
set -x DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock

set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x PARALLEL_HOME $XDG_CONFIG_HOME/parallel
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x LESSHISTFILE $XDG_CACHE_HOME/less/history
set -x GHCUP_USE_XDG_DIRS 1

set -a PATH "$XDG_BIN_HOME"
set -a PATH "$HOME/.dotfiles/bin"

if command -q go
	set -a PATH "$(go env GOPATH)/bin"
end
if command -q cargo
	set -a PATH "$CARGO_HOME/bin"
end
if command -q npm
	set -a PATH "$XDG_DATA_HOME/npm/bin"
end
if command -q dotnet
	set -a PATH "$HOME/.dotnet/tools"
end

set -g fish_greeting

if not status is-interactive
	return
end

### Alias
function mkcd
    mkdir $argv[1] && cd $argv[1]
end
function __scoped_edit
	pushd $argv[1]
    nvim .
	popd
end

alias ls='eza --icons --sort=type --classify=always --group'
alias la='ls -a'
alias lsl='ls -l'
alias lal='lsl -a'
alias ip='ip --color=auto'
alias conf='__scoped_edit $HOME/.dotfiles/'
alias wp-pull='rclone sync gdrive_crypt:Pictures/Wallpapers $HOME/Pictures/Wallpapers -P'
alias wp-push='rclone sync $HOME/Pictures/Wallpapers gdrive_crypt:Pictures/Wallpapers -P'
alias book-pull='rclone sync gdrive_crypt:Documents/Books $HOME/Documents/Books -P'
alias book-push='rclone sync $HOME/Documents/Books gdrive_crypt:Documents/Books -P'
alias :q='exit' # I'm done with this
alias rm='trash'

zoxide init --cmd cd fish | source
