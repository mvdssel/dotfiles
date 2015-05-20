#!/bin/bash

. printexec
. colors

src="/Users/maartenvandessel/Music/iTunes/iTunes Media/Music/"
dest="/Users/maartenvandessel/Dropbox/GSM/Music/"

for link in "$@"; do
    if [[ -d "$link" ]]; then
        printexec ln -s "$src/$link" "$dest"
    else
        echo -e "${Error}Error: ${Reset}$link is not a directory in $src"
    fi
done

