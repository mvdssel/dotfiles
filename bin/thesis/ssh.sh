#!/bin/bash

. ~/bin/thesis/config.sh

ssh -A -CX -i "$certificate" $user@$server -oPort=$port $@

# use as: 
#       ./ssh.sh
# or:
#       ./ssh.sh ls '~/hips/ontology-simulation-tests/reports'
