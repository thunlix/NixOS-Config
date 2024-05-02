#!/run/current-system/sw/bin/bash

## Load VM variables
source "/var/lib/libvirt/hooks/qemu.d/win10/vm-vars.conf"

## Use supergfxctl to set graphics mode to vfio
echo "Resetting graphics mode back to integrated..."
supergfxctl -m integrated

echo "Graphics mode reset!"
sleep 1
