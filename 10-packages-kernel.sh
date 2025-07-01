# shellcheck shell=bash
if [[ ${USES_CACHY_KERNEL} == true ]]; then
  AddPackage linux-cachyos              # The Linux BORE + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel and modules
  AddPackage linux-cachyos-headers      # Headers and scripts for building modules for the Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and improvements
  AddPackage linux-cachyos-lts          # The Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and improvements - Long Term Service kernel and modules
  AddPackage linux-cachyos-lts-headers  # Headers and scripts for building modules for the Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and improvements - Long Term Service kernel
  CopyFile /etc/mkinitcpio.d/linux-cachyos.preset
  CopyFile /etc/mkinitcpio.d/linux-cachyos-lts.preset
else
  AddPackage linux                   # The Linux kernel and modules
  AddPackage linux-headers           # Headers and scripts for building modules for the Linux kernel
  AddPackage linux-lts               # The LTS Linux kernel and modules
  AddPackage linux-lts-headers       # Headers and scripts for building modules for the LTS Linux kernel
  AddPackage linux-zen               # The Linux ZEN kernel and modules
  AddPackage linux-zen-headers       # Headers and scripts for building modules for the Linux ZEN kernel
  CopyFile /etc/mkinitcpio.d/linux.preset
  CopyFile /etc/mkinitcpio.d/linux-lts.preset
  CopyFile /etc/mkinitcpio.d/linux-zen.preset
fi
AddPackage linux-firmware          # Firmware files for Linux

