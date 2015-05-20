#!/bin/bash

. ~/bin/thesis/config.sh

src='~/hips/ontology-simulation-tests/reports/'
src='~/hips/ontology-simulation-tests/*.log'
dest="$HOME/bin/thesis/assets/"
options='-r'

scp $options -oPort=$port -i "$certificate" $user@$server:"$src" "$dest"
