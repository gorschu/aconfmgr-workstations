# shellcheck shell=bash
IgnorePath '/boot/*.img'
IgnorePath '/boot/vmlinuz*'
IgnorePath '/boot/EFI'
IgnorePath '/boot/loader/entries*'
IgnorePath '/boot/loader/keys'
IgnorePath '/boot/loader/random-seed'
IgnorePath '/etc/fstab' # it is highly dynamic and anything additional we would add via systemd .mount-units
IgnorePath '/etc/ca-certificates'
IgnorePath '/etc/shells'
IgnorePath '/etc/ssl'
IgnorePath '/etc/pacman.d/gnupg'
IgnorePath '/etc/ld.so.cache'

IgnorePath '/etc/.updated'
IgnorePath '/etc/.pwd.lock'
IgnorePath '/etc/brlapi.key'
IgnorePath '/etc/passwd*'
IgnorePath '/etc/shadow*'
IgnorePath '/etc/machine-id'
IgnorePath '/etc/tuned/*'
IgnorePath '/etc/cups/subscriptions*'
IgnorePath '/etc/printcap'

IgnorePath '/usr/lib'
IgnorePath '/usr/lib/vlc/plugins/plugins.dat'
IgnorePath '/usr/share'

IgnorePath '/var/.updated'
IgnorePath '/var/lib'
IgnorePath '/var/log'
IgnorePath '/var/spool'
IgnorePath '/var/tmp'
