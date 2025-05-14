# shellcheck shell=bash

. lib/root_partition.sh

rootUUID=$(get_root_UUID "$(hostnamectl hostname)")
echo "rd.luks.uuid=${rootUUID} root=/dev/mapper/luks-${rootUUID} rw rootflags=subvol=@ rootfstype=btrfs" >"$(CreateFile /etc/cmdline.d/root.conf)"
