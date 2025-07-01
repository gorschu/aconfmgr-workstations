# shellcheck shell=bash
. lib/root_partition.sh

if [[ "${DATA_USES_BTRFS}" == true ]]; then
  AddPackage btrbk   # Tool for creating snapshots and remote backups of btrfs subvolumes
  AddPackage mbuffer # A tool for buffering data streams

  set -vx
  root_luks_UUID=$(get_root_luks_UUID "$(hostnamectl hostname)")

  # create btrfs root mountpoint for btrbk
  cat >"$(CreateFile /etc/systemd/system/\\x2ebtrfs\\x2droot.mount)" <<EOF
  [Unit]
  Description=Mount btrfs root

  [Mount]
  What=UUID=${root_luks_UUID}
  Where=/.btrfs-root
  Type=btrfs
  Options=subvolid=5,X-mount.mkdir

  [Install]
  WantedBy=multi-user.target
EOF
  CreateLink /etc/systemd/system/multi-user.target.wants/\\x2ebtrfs\\x2droot.mount /etc/systemd/system/\\x2ebtrfs\\x2droot.mount

  cat >"$(CreateFile /etc/btrbk/btrbk.conf)" <<EOF
  # Enable transaction log
  transaction_log            /var/log/btrbk.log

  # Specify SSH private key for remote connections
  ssh_identity               /etc/btrbk/ssh/id_ed25519
  ssh_user                   root

  # Use sudo if btrbk or lsbtr is run by regular user
  backend_local_user         btrfs-progs-sudo

  stream_buffer              256m

  # Enable lock file support: Ensures that only one instance of btrbk
  # can be run at a time.
  #lockfile                   /var/lock/btrbk.lock

  volume /.btrfs-root
    snapshot_dir      @snapshots
    timestamp_format  long
    subvolume @home
    snapshot_name           $(hostnamectl hostname).home
      snapshot_preserve_min   48h
      snapshot_preserve       48h 31d
      snapshot_create         always
    subvolume @
    snapshot_name           $(hostnamectl hostname).root
      snapshot_preserve_min   24h
      snapshot_preserve       24h 3d
      snapshot_create         always
EOF

  CopyFile /etc/systemd/system/btrbk.timer.d/override.conf
  CreateLink /etc/systemd/system/timers.target.wants/btrbk.timer /usr/lib/systemd/system/btrbk.timer

  sudo systemctl daemon-reload
fi
