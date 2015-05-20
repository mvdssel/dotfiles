#!/bin/bash

. printexec

if=en1
old_mac=$( ifconfig en1 ether|grep -E '([a-f0-9]{2}:){5}[a-f0-9]{2}'|sed -E 's@.*(([a-f0-9]{2}:){5}[a-f0-9]{2}).*@\1@' )
new_mac=$( openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' )

# mountain-lion & mavericks:
printexec sudo ifconfig $1 ether $new_mac

echo "old mac: $old_mac"
echo "new mac: $new_mac"
