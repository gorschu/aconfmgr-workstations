# shellcheck shell=bash
if [[ ${DATA_USES_ZFS} == true ]]; then
  CopyFile "/etc/modprobe.d/zfs.conf"
  CopyFile "/etc/zfs/zfskey_rpool_$(hostnamectl hostname)" 600
  CopyFile "/etc/systemd/system/zfs-load-key.service"
  IgnorePath "/etc/zfs/zpool.cache"

  CreateLink /etc/systemd/system/multi-user.target.wants/zfs.target /usr/lib/systemd/system/zfs.target
  CreateLink /etc/systemd/system/zfs-import.target.wants/zfs-import-scan.service /usr/lib/systemd/system/zfs-import-scan.service
  CreateLink /etc/systemd/system/zfs-mount.service.wants/zfs-load-key.service /etc/systemd/system/zfs-load-key.service
  CreateLink /etc/systemd/system/zfs-volumes.target.wants/zfs-volume-wait.service /usr/lib/systemd/system/zfs-volume-wait.service
  CreateLink /etc/systemd/system/zfs.target.wants/zfs-import.target /usr/lib/systemd/system/zfs-import.target
  CreateLink /etc/systemd/system/zfs.target.wants/zfs-mount.service /usr/lib/systemd/system/zfs-mount.service
  CreateLink /etc/systemd/system/zfs.target.wants/zfs-volumes.target /usr/lib/systemd/system/zfs-volumes.target

  CreateLink /etc/systemd/system/multi-user.target.wants/zrepl.service /usr/lib/systemd/system/zrepl.service
fi
