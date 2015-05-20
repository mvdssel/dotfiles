#!/bin/bash

# Path to script
path=$( echo $0|sed -E "s@$HOME@~@" )

# User checking
[[ $(whoami) != root ]] && { echo "$path: Script must be run as root." >&2; exit 1; }

TMPFILE=$(mktemp /tmp/`basename $0`.XXXXXX) || exit 2

wash -i en1 -C -s -o $TMPFILE 2>/dev/null 1>&2 &
trap "{
    sudo kill $!
    rm \"$TMPFILE\"
    exit 0
}" 2    # kill wash on <ctrl-C>

clear
while true; do
    echo Scanning...
    sleep 2
    clear
    cat $TMPFILE|grep No|uniq|sort -k 2 2>/dev/null
done
