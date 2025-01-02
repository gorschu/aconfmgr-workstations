# shellcheck shell=bash
AddPackage base                # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel          # Basic tools to build Arch Linux packages
AddPackage bat                 # Cat clone with syntax highlighting and git integration
AddPackage btrfs-progs         # Btrfs filesystem utilities
AddPackage chezmoi             # Manage your dotfiles across multiple machines
AddPackage devtools            # Tools for Arch Linux package maintainers
AddPackage efibootmgr          # Linux user-space application to modify the EFI Boot Manager
AddPackage git                 # the fast distributed version control system
AddPackage git-crypt           # Transparent file encryption in Git
AddPackage gptfdisk            # A text-mode partitioning tool that works on GUID Partition Table (GPT) disks
AddPackage gst-plugin-pipewire # Multimedia graph framework - pipewire plugin
AddPackage htop                # Interactive process viewer
AddPackage intel-media-driver  # Intel Media Driver for VAAPI — Broadwell+ iGPUs
AddPackage just                # A handy way to save and run project-specific commands
AddPackage less                # A terminal based program for viewing text files
AddPackage libpulse            # A featureful, general-purpose sound server (client library)
AddPackage libva-intel-driver  # VA-API implementation for Intel G45 and HD Graphics family
AddPackage linux               # The Linux kernel and modules
AddPackage linux-firmware      # Firmware files for Linux
AddPackage pipewire            # Low-latency audio/video router and processor
AddPackage pipewire-alsa       # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-jack       # Low-latency audio/video router and processor - JACK replacement
AddPackage pipewire-pulse      # Low-latency audio/video router and processor - PulseAudio replacement
AddPackage smartmontools       # Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives
AddPackage vulkan-intel        # Open-source Vulkan driver for Intel GPUs
AddPackage vulkan-radeon       # Open-source Vulkan driver for AMD GPUs
AddPackage wireplumber         # Session / policy manager implementation for PipeWire
AddPackage zram-generator      # Systemd unit generator for zram devices

AddPackage crun           # A fast and lightweight fully featured OCI runtime and C library for running containers
AddPackage podman         # Tool and library for running OCI-based containers in pods
AddPackage podman-compose # A script to run docker-compose.yml using podman

AddPackage sbsigntools   # Tools to add signatures to EFI binaries and Drivers
AddPackage systemd-ukify # Combine kernel and initrd into a signed Unified Kernel Image
# neovim
AddPackage neovim       # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland


AddPackage linux-cachyos # The Linux BORE + LTO + AutoFDO Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel and modules

AddPackage man-db # A utility for reading man pages
AddPackage tldr   # Command line client for tldr, a collection of simplified man pages.

RemovePackage nano
