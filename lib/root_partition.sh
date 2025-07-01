# shellcheck shell=bash
#
function get_root_UUID {
  sudo blkid -s UUID -o value /dev/disk/by-id/"${PARTITIONS_ROOT_ID}"
}
function get_root_luks_UUID {
  root_uuid=$(get_root_UUID "$(hostnamectl hostname)")
  sudo blkid -s UUID -o value /dev/disk/by-id/dm-name-luks-"${root_uuid}"
}
