# shellcheck shell=bash
declare -A partitions_root
partitions_root["vm-test"]="ata-QEMU_HARDDISK_QM00003-part2"
partitions_root["apollo"]="nvme-eui.0025388311b2ba65-part2"

function get_root_UUID {
  sudo blkid -s UUID -o value /dev/disk/by-id/"${partitions_root["${1}"]}"
}

rootUUID=$(get_root_UUID "$(hostnamectl hostname)")
echo "rd.luks.uuid=${rootUUID} root=/dev/mapper/luks-${rootUUID} rw rootflags=subvol=@ rootfstype=btrfs" >"$(CreateFile /etc/cmdline.d/root.conf)"
