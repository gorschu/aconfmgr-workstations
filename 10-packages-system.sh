# shellcheck shell=bash
AddPackage base                # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel          # Basic tools to build Arch Linux packages
AddPackage btrfs-progs         # Btrfs filesystem utilities
AddPackage efibootmgr          # Linux user-space application to modify the EFI Boot Manager
AddPackage gptfdisk            # A text-mode partitioning tool that works on GUID Partition Table (GPT) disks
AddPackage linux               # The Linux kernel and modules
AddPackage linux-firmware      # Firmware files for Linux
AddPackage smartmontools       # Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives
AddPackage zram-generator      # Systemd unit generator for zram devices


AddPackage sbsigntools   # Tools to add signatures to EFI binaries and Drivers
AddPackage systemd-ukify # Combine kernel and initrd into a signed Unified Kernel Image
AddPackage linux-cachyos # The Linux BORE + LTO + AutoFDO Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel and modules
