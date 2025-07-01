# shellcheck shell=bash
if [[ ${DATA_USES_ZFS} == true ]]; then
  AddPackage linux-cachyos-zfs     # zfs module for the Linux BORE + LTO + AutoFDO Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel
  AddPackage linux-cachyos-lts-zfs # zfs module for the Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and improvements - Long Term Service kernel
  AddPackage zfs-utils             # Userspace utilities for the Zettabyte File System.
  AddPackage zrepl-git             # One-stop ZFS backup & replication solution

  sudo modprobe zfs 2>/dev/null || true
fi
