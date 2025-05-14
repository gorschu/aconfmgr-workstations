# shellcheck shell=bash
declare -A partitions_root
partitions_root["vm-test"]="ata-QEMU_HARDDISK_QM00003-part2"
partitions_root["apollo"]="nvme-eui.0025388311b2ba65-part2"
partitions_root["artemis"]="nvme-eui.00000000000000000026b7685ec110a5-part2"
export partitions_root

function get_root_UUID {
  sudo blkid -s UUID -o value /dev/disk/by-id/"${partitions_root["${1}"]}"
}
