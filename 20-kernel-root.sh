# shellcheck shell=bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
. "${SCRIPT_DIR}/lib/root_partition.sh"

rootUUID=$(get_root_UUID "$(hostnamectl hostname)")
echo "rd.luks.uuid=${rootUUID} root=/dev/mapper/luks-${rootUUID} rw rootflags=subvol=@ rootfstype=btrfs" >"$(CreateFile /etc/cmdline.d/root.conf)"

# remove old /etc/kernel/cmdline from archinstall
rm -f /etc/kernel/cmdline
