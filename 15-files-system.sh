# shellcheck shell=bash
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/Berlin
CopyFile /etc/subgid
CopyFile /etc/subuid
CopyFile /etc/sudoers.d/00_gorschu 440
CopyFile /etc/systemd/zram-generator.conf
CopyFile /etc/vconsole.conf
CreateFile /var/db/sudo/lectured/1000 600 '' gorschu >/dev/null
CopyFile /etc/group
CopyFile /etc/group-
CopyFile /etc/gshadow
CopyFile /etc/gshadow- 600

CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf

CopyFile /etc/modules-load.d/filesystems.conf

CopyFile /usr/lib/systemd/system-sleep/batenergy.sh
SetFileProperty /usr/lib/systemd/system-sleep/batenergy.sh mode 755

# Enable Magic SysRq
echo "kernel.sysrq = 1" >"$(CreateFile /etc/sysctl.d/99-sysrq.conf)"

CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/sockets.target.wants/systemd-userdbd.socket /usr/lib/systemd/system/systemd-userdbd.socket
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket

CreateLink /etc/systemd/system/dbus-org.freedesktop.Avahi.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/multi-user.target.wants/avahi-daemon.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/sockets.target.wants/avahi-daemon.socket /usr/lib/systemd/system/avahi-daemon.socket

SetFileProperty /usr/bin/groupmems group groups
SetFileProperty /usr/bin/groupmems mode 2750
SetFileProperty /var/log/journal group systemd-journal

CreateLink /etc/os-release ../usr/lib/os-release

CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service

SetFileProperty /var/lib/passim/data group passim
SetFileProperty /var/lib/passim/data owner passim
SetFileProperty /var/lib/passim group passim
SetFileProperty /var/lib/passim owner passim
