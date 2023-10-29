#!/bin/zsh

dotfiles_dir=${0:a:h}

curr_dir=$(pwd)
cd $dotfiles_dir

# declare all files to bootstrap
configs=(
    .config/emacs/init.el
    .config/starship.toml
    .prboom-plus/prboom-plus.cfg
    .xserverrc
    .zshenv
    .zshrc
    .config/nvim
    .config/foot
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
    if [[ -e "$HOME/.dotfiles/$i" ]]
    then
        handle_entry $i $dotfiles_dir
    fi
done

cd $curr_dir
