#!/run/current-system/sw/bin/bash

## Load VM variables
source "/etc/libvirt/hooks/qemu.d/win10/vm-vars.conf"

## Kill Looking Glass
echo "Killing Looking Glass..."
killall looking-glass-client

sleep 1
