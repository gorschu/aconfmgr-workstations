# shellcheck shell=bash
AddPackage systemtap # Infrastructure to simplify the gathering of information about the running Linux system
AddPackage tuned     # Daemon that performs monitoring and adaptive configuration of devices in the system
AddPackage tuned-ppd # Daemon that allows applications to easily transition to TuneD from power-profiles-daemon (PPD)

CreateFile /etc/modprobe.d/tuned.conf >/dev/null
CreateLink /etc/systemd/system/multi-user.target.wants/tuned.service /usr/lib/systemd/system/tuned.service
