# shellcheck shell=bash
AconfNeedProgram yq go-yq n

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
config="${SCRIPT_DIR}/config.yml"

host=$(hostnamectl hostname)
declare -a DESKTOPS
export DESKTOPS=$(yq '.'${host}'.desktops | "(" + (map("'\''" + . + "'\''") | join(",")) + ")"' "${config}")
export DATA_USES_ZFS=$(yq '.'${host}'.uses_zfs' "${config}")
export DATA_USES_BTRFS=$(yq '.'${host}'.uses_btrfs' "${config}")
export PARTITIONS_ROOT_ID=$(yq '.'${host}'.partitions.root' "${config}")
export USES_CACHY_KERNEL=$(yq '.'${host}'.uses_cachy_kernel' "${config}")
