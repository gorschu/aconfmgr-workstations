# shellcheck shell=bash

set -euo pipefail

if lscpu | grep -q "Vendor ID:.*AuthenticAMD"; then
  AddPackage amd-ucode
elif lscpu | grep -q "Vendor ID:.*GenuineIntel"; then
  AddPackage intel-ucode
fi
