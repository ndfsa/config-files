#!/bin/dash

# reference: https://github.com/le0me55i/zsh-extract/blob/master/extract.plugin.zsh

# I just did a little tinkering with this script and made it POSIX compliant...
# from what I can see, it is, but I could be wrong.

if [ $# = 0 ]; then
    printf '%s\n' '' \
        'No arguments were provided.' \
        'Usage: extract.sh [OPTION] file [file...][[OPTION] [file...]]' \
        'Options:' \
        '    -r, --remove       Remove the original archive file after' \
        '                       unpacking it.' \
        1>&2
    return 1
fi

while [ $# -gt 0 ]; do
    if [ "$1" = "-r" ] || [ "$1" = "--remove" ]; then
        rm_archive=true
        echo "cond works"
        shift
        continue
    fi
    if [ ! -f $1 ]; then
        printf '%s\n' "$1 is not a valid file or does not exist."
        return 1
    fi
    extract_dir=${1##*/}
    echo $extract_dir
    extract_dir=${extract_dir%%.*}
    case $1 in
        *.tar.gz|*.tgz) tar zxvf "$1";;
        *.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
        *.tar.xz|*.txz) tar --xz -xvf "$1" ;;
        *.tar.zma|*.tlz) tar --lzma -xvf "$1" ;;
        *.tar.zst|*.tzst) tar --zstd -xvf "$1" ;;
        *.tar) tar xvf "$1" ;;
        *.tar.lz) tar xvf "$1" ;;
        *.gz) gunzip -k "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.xz) unxz "$1" ;;
        *.lzma) unlzma "$1" ;;
        *.z) uncompress "$1" ;;
        *.zip|*.war|*.jar|*.sublime-package|*.ipsw|*.xpi|*.apk|*.aar|*.whl) unzip "$1" ;;
        *.rar) unrar x -ad "$1" ;;
        *.rpm) mkdir "$extract_dir" && cd "$extract_dir" && rpm2cpio "../$1" | cpio --quiet -id && cd .. ;;
        *.7z) 7za x "$1" ;;
        *.deb)
            mkdir -p "$extract_dir/control"
            mkdir -p "$extract_dir/data"
            cd "$extract_dir"; ar vx "../${1}" > /dev/null
            cd control; tar xzvf ../control.tar.gz
            cd ../data; extract ../data.tar.*
            cd ..; rm *.tar.*
            cd ..
            ;;
        *.zst) unzstd "$1" ;;
        *)
            printf "%s\n" "extract: '$1' could be extracted" 1>&2
            return 1
            ;;
    esac
    [ "$rm_archive" = true ] && rm_archive=false && rm "$1"
    shift
done
return 0
