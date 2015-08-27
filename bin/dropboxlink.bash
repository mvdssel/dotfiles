#!/bin/bash

. printexec
. colors

src="$HOME/Music/iTunes/iTunes Media/Music/"
dest="$HOME/Dropbox/GSM/Music/"

for link in "$@"; do
    if [[ -d "$link" ]]; then
        printexec ln -s "$src/$link" "$dest"
    else
        echo -e "${Error}Error: ${Reset}$link is not a directory in $src"
    fi
done

