#!/bin/bash

. printexec

#################
# parameters
INTERFACE=$1
[[ -z "$INTERFACE" ]] && INTERFACE=en0

#################
# functions
getMac="ifconfig $INTERFACE | grep ether| cut -d ' ' -f 2"
generateMac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/./0/2; s/.$//'"
wifiOn="networksetup -setairportpower $INTERFACE on"
wifiOff="networksetup -setairportpower $INTERFACE off"
wifiReset="($wifiOff; $wifiOn)"
detectChanges="networksetup -detectnewhardware"

#################
#script
echo "old MAC address:" $( eval "$getMac" )

# detach so it can set a new MAC address
printexec sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
# set a new MAC address
printexec sudo ifconfig $INTERFACE ether $( eval "$generateMac")
# let the hardware detect these changes
printexec $detectChanges
# reset Wifi, so it reconnects to the network automatically
printexec eval "$wifiReset&"

echo "new MAC address:" $( eval "$getMac" )
