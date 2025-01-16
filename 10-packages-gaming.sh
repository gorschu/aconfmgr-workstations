# shellcheck shell=bash

if [[ $(hostnamectl hostname) =~ artemis ]]; then
  if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    sudo tee -a "/etc/pacman.conf" >/dev/null <<'EOF'
[multilib]
Include = /etc/pacman.d/mirrorlist
EOF
    sudo pacman -Sy
  fi
  AddPackage lib32-vulkan-radeon # Open-source Vulkan driver for AMD GPUs - 32-bit
  AddPackage steam               # Valve's digital software delivery system
  AddPackage proton-cachyos      # Compatibility tool for Steam Play based on Wine and additional components, experimental branch with extra CachyOS flavour
  AddPackage protonup-qt         # Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris

  IgnorePath "/usr/lib32"
fi
