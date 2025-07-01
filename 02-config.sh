# shellcheck shell=bash
AconfNeedProgram yq go-yq n

host=$(hostnamectl hostname)
declare -a DESKTOPS
export DESKTOPS=$(yq '.'${host}'.desktops | "(" + (map("'\''" + . + "'\''") | join(",")) + ")"' config.yml)
export DATA_USES_ZFS=$(yq '.'${host}'.uses_zfs' config.yml)
export DATA_USES_BTRFS=$(yq '.'${host}'.uses_btrfs' config.yml)
export PARTITIONS_ROOT_ID=$(yq '.'${host}'.partitions.root' config.yml)
export USES_CACHY_KERNEL=$(yq '.'${host}'.uses_cachy_kernel' config.yml)
