# shellcheck shell=bash
chassis=$(hostnamectl chassis)
vendor=$(hostnamectl | grep "Hardware Vendor" | awk -F':' '{print $2}' | sed -r 's/^\s*//')
if [[ ${chassis} == "laptop" ]] && [[ ${vendor} == "Lenovo" ]]; then
  AddPackage --foreign tpacpi-bat # A Perl script with ACPI calls for recent ThinkPads (such as T420 and W520) whose battery thresholds are not supported by tp_smapi
  AddPackage acpi_call-dkms       # A linux kernel module that enables calls to ACPI methods through /proc/acpi/call - module sources

  CreateLink /etc/systemd/system/multi-user.target.wants/tpacpi-bat.service /usr/lib/systemd/system/tpacpi-bat.service

  f="$(GetPackageOriginalFile tpacpi-bat /etc/conf.d/tpacpi)"
  sed -i -r 's/^START_THRESHOLD=\"([0-9]+)\"$/START_THRESHOLD=\"30\"/' "${f}"
  sed -i -r 's/^STOP_THRESHOLD=\"([0-9]+)\"$/STOP_THRESHOLD=\"90\"/' "${f}"
fi
