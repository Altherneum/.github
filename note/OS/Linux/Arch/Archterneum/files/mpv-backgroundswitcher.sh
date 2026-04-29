#!/usr/bin/env bash

if [ x"$@" = x"quit" ];
    then exit 0
elif [[ $# -eq 0 ]]; then
    maxvideoamount=$(~/.config/hypr/mpvpaper.sh getFileCount ~/.config/hypr/backgrounds/)
    counter=1
    
    while [ $counter -le $maxvideoamount ]; do
        echo "Background n° "$counter
        ((counter++))
    done

    echo "reload"
    echo "quit"
elif [ x"$@" = x"reload" ];
    then : #nothing
else
    input=$1
    words=($input)
    $(~/.config/hypr/mpvpaper.sh setVideoNumber ${words[2]})
fi

