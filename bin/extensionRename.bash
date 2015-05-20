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

echo -e -n "Provide the 'from' extension:\n> "
read inputExt
echo -e -n "Provide the 'to' extension:\n> "
read outputExt

echo -e "Will rename all files named '*${Warning}.${inputExt}${Reset}' to '*${Warning}.${outputExt}${Reset}'"
pause 'Continue? (press <CTRL-C> to exit)'

for file in $(find . -name "*.$inputExt" $depth); do
    printexec mv "$file" $(echo "$file"|sed -E "s/^(.*)\.${inputExt}$/\1\.${outputExt}/g")
done
