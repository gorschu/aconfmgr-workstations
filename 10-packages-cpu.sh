# shellcheck shell=bash

set -euo pipefail

if lscpu | grep -q "Vendor ID:.*AuthenticAMD"; then
  AddPackage amd-ucode
fi
