#!/bin/zsh

dotfiles_dir="$HOME/.dotfiles"

pushd $dotfiles_dir

configs=(
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
