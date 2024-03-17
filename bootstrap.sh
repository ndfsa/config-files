#!/bin/zsh

which go && go env -w GOPATH="$HOME/.local/share/go"
which npm && npm config set prefix="$HOME/.local/share/npm"
which npm && npm config set cache="$XDG_CACHE_HOME/npm"

dotfiles_dir="$HOME/.dotfiles"

pushd $dotfiles_dir

# declare all files to bootstrap
configs=(
    .config/emacs/init.el
    .config/starship.toml
    .prboom-plus/prboom-plus.cfg
    .xserverrc
    .zshenv
    .zshrc
    .config/nvim
    .config/sxhkd
    .config/wezterm
    .local/bin/*
)

# handle all files
function handle_entry() {
    filename=$(basename $1)
    parent=$(dirname $1)

    # if parent is dot or if it exitsts do not create it
    [[ $parent != "." ]] \
        && [[ ! -e $parent ]] \
        && mkdir --parent $HOME/$parent

    [[ ! -e $HOME/$1 ]] \
        && ln -sv $2/$1 $HOME/$1
}

for i in $configs
do
    if [[ -e "$dotfiles_dir/$i" ]]
    then
        handle_entry $i $dotfiles_dir
    fi
done

popd
