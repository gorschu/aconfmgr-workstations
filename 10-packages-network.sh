# shellcheck shell=bash
AddPackage aria2          # Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink
AddPackage bluez-utils    # Development and debugging utilities for the bluetooth protocol stack
AddPackage gnu-netcat     # GNU rewrite of netcat, the network piping application
AddPackage iwd            # Internet Wireless Daemon
AddPackage ldns           # Fast DNS library supporting recent RFCs
AddPackage mtr            # Combines the functionality of traceroute and ping into one tool (CLI version)
AddPackage openssh        # SSH protocol implementation for remote login, command execution and file transfer
AddPackage rclone         # Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage
AddPackage rsync          # A fast and versatile file copying tool for remote and local files
AddPackage sshfs          # FUSE client based on the SSH File Transfer Protocol
AddPackage tailscale      # A mesh VPN that makes it easy to connect your devices, wherever they are.
AddPackage wget           # Network utility to retrieve files from the Web
AddPackage wireless-regdb # Central Regulatory Domain Database
AddPackage wireless_tools # Tools allowing to manipulate the Wireless Extensions

CopyFile /etc/conf.d/wireless-regdom
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service

# ssh
CopyFileTo "/etc/ssh/$HOSTNAME/ssh_host_ecdsa_key" /etc/ssh/ssh_host_ecdsa_key 600
CopyFileTo "/etc/ssh/$HOSTNAME/ssh_host_ecdsa_key.pub" /etc/ssh/ssh_host_ecdsa_key.pub
CopyFileTo "/etc/ssh/$HOSTNAME/ssh_host_ed25519_key" /etc/ssh/ssh_host_ed25519_key 600
CopyFileTo "/etc/ssh/$HOSTNAME/ssh_host_ed25519_key.pub" /etc/ssh/ssh_host_ed25519_key.pub
CopyFileTo "/etc/ssh/$HOSTNAME/ssh_host_rsa_key" /etc/ssh/ssh_host_rsa_key 600
CopyFileTo "/etc/ssh/$HOSTNAME/ssh_host_rsa_key.pub" /etc/ssh/ssh_host_rsa_key.pub
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
#
# systemd-resolved
CreateLink /etc/systemd/system/dbus-org.freedesktop.resolve1.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-resolved.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/resolv.conf ../run/systemd/resolve/stub-resolv.conf

CreateLink /etc/systemd/system/multi-user.target.wants/tailscaled.service /usr/lib/systemd/system/tailscaled.service
