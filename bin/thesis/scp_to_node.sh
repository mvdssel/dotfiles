#!/bin/bash

. ~/bin/thesis/config.sh

src="$HOME/bin/thesis/jdk-8u45-linux-x64.tar.gz"
src="$HOME/bin/thesis/apache-maven-3.3.3-bin.tar.gz"
src="$HOME/bin/thesis/hips.zip"
src="$HOME/bin/thesis/script.sh"
dest='~/'
# options='-r'

scp $options -oPort=$port -i "$certificate" "$src" $user@$server:"$dest"
