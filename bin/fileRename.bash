#!/bin/bash

. pause
. colors
. printexec

depth="-maxdepth 1"
while [[ -n $1 ]]; do
	case $1 in
		# Rename recursively
		-r|--recursive )    depth=""
                            shift 	;;
		# Catch invalid options
		* )				    echo "Invalid option: $1" 1>&2
						    exit 1	;;
	esac
done

if [[ -n "$depth" ]];
then
    echo -e "Option Recursive:\t${Error}OFF${Reset}"
else
    echo -e "Option Recursive:\t${Success}ON${Reset}"
fi

echo -e -n "Provide the 'from' part:\n> "
read inputExt
echo -e -n "Provide the 'to' part:\n> "
read outputExt

echo -e "Will rename all files from '${Cyan}\\1${Warning}${inputExt}${Cyan}\\2${Reset}' to '${Cyan}\\1${Warning}${outputExt}${Cyan}\\2${Reset}'"
pause 'Continue? (press <CTRL-C> to exit)'

count=0
for file in $(find . -name "*$inputExt*" $depth); do
    printexec mv "$file" $(echo "$file"|sed -E "s/^(.*)${inputExt}(.*)$/\1${outputExt}\2/g")
    (( count++ ))
done

if [[ count -eq 0 ]];
then
    echo "No files were renamed."
fi
