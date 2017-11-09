#!/bin/bash

. printexec

# parameters
INTERFACE=$1
[[ -z "$INTERFACE" ]] && INTERFACE=en0

# functions
getMac="ifconfig $INTERFACE | grep ether| cut -d ' ' -f 2"
generateMac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/./0/2; s/.$//'"
wifiOn="networksetup -setairportpower $INTERFACE on"
wifiOff="networksetup -setairportpower $INTERFACE off"
detectChanges="networksetup -detectnewhardware"

#script
echo "old MAC address:" $( eval "$getMac" )
printexec sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
printexec sudo ifconfig $INTERFACE ether $( eval "$generateMac")
printexec $detectChanges
# eval "$wifiOff"
# eval "$wifiOn"
echo "new MAC address:" $( eval "$getMac" )
