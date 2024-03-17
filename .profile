### XDG spec
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_BIN_HOME=$HOME/.local/bin

export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME=base16
export PAGER=bat
export BROWSER=chromium
export LS_COLORS='di=1;34:ln=36:so=1;31:pi=33:ex=1;32:bd=1;33:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SXHKD_SHELL=dash
export JDTLS_HOME=/usr/share/java/jdtls
export FZF_DEFAULT_OPTS=--color=16
export DIFFPROG='nvim -d'
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

export CARGO_HOME=$XDG_DATA_HOME/cargo
export PARALLEL_HOME=$XDG_CONFIG_HOME/parallel
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export LESSHISTFILE=$XDG_CACHE_HOME/less/history
export GHCUP_USE_XDG_DIRS=1

### paths

CUSTOM_PATHS=( $HOME/.local/bin )

[[ -n $(command -v go) ]] && CUSTOM_PATHS+=( "$(go env GOPATH)/bin" )
[[ -n $(command -v cargo) ]] && CUSTOM_PATHS+=( "$CARGO_HOME/bin" )
[[ -n $(command -v npm) ]] && CUSTOM_PATHS+=( "$XDG_DATA_HOME/npm/bin" )
[[ -n $(command -v dotnet) ]] && CUSTOM_PATHS+=( "$HOME/.dotnet/tools" )

for i in ${CUSTOM_PATHS[@]}
do
    case ":$PATH:" in
        *":$i:"*) ;;
        *) PATH="$i:$PATH";;
    esac
done
