# shellcheck shell=bash
function PacmanConfFilter() {
  # exclude multilib configurations
  sed '/^\[multilib\]/,+1d'
}
CopyFile /etc/pacman.conf
AddFileContentFilter '/etc/pacman.conf' PacmanConfFilter
CopyFile /etc/pacman.d/mirrorlist
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux.preset
CopyFile /etc/mkinitcpio.d/linux-lts.preset
CopyFile /etc/mkinitcpio.d/linux-zen.preset
