# shellcheck shell=bash
IgnorePath '/boot'
IgnorePath '/etc/fstab' # it is highly dynamic and anything additional we would add via systemd .mount-units
IgnorePath '/etc/ca-certificates'
IgnorePath '/etc/ssl'
IgnorePath '/etc/pacman.d/gnupg'
IgnorePath '/etc/ld.so.cache'

IgnorePath '/etc/.updated'
IgnorePath '/etc/.pwd.lock'
IgnorePath '/etc/group*'
IgnorePath '/etc/passwd*'
IgnorePath '/etc/gshadow*'
IgnorePath '/etc/shadow**'
IgnorePath '/etc/machine-id'

IgnorePath '/usr/lib'
IgnorePath '/usr/lib/vlc/plugins/plugins.dat'
IgnorePath '/usr/share'

IgnorePath '/var/.updated'
IgnorePath '/var/lib'
IgnorePath '/var/log'
IgnorePath '/var/tmp'
