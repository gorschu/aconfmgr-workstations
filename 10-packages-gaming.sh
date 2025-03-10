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
  AddPackage wowup-cf-bin        # WowUp the World of Warcraft addon updater (with CurseForge support)

  AddPackage --foreign weakauras-companion-bin # A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.

  flatpak install flathub --user -y net.lutris.Lutris

  IgnorePath "/usr/lib32"
fi
