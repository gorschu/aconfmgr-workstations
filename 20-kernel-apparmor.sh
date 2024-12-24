# shellcheck shell=bash
AddPackage apparmor # Mandatory Access Control (MAC) using Linux Security Module (LSM)
echo "lsm=landlock,lockdown,yama,integrity,apparmor,bpf" >"$(CreateFile /etc/cmdline.d/apparmor.conf)"
CreateLink /etc/systemd/system/multi-user.target.wants/apparmor.service /usr/lib/systemd/system/apparmor.service
