#!/bin/bash

set -euo pipefail

hostname=$(hostnamectl hostname)
prefix=""

function cleanUpUser {
  if [[ "${hostname}" == "archiso" ]] && [[ "${EUID}" == 0 ]] && getent passwd archiso &>/dev/null; then
    sudo userdel --remove --force archiso
    sudo rm /etc/sudoers.d/archiso
  fi
}

trap "cleanUpUser" EXIT

if [[ "${hostname}" == "archiso" ]] && [[ "${EUID}" == 0 ]]; then
  useradd archiso -m
  echo "archiso ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/archiso >/dev/null
  prefix="run0 --user archiso"
  sudo mount -o remount,size=1G /run/archiso/cowspace
elif [[ "${EUID}" != 0 ]]; then
  prefix="run0 --user $(whoami)"
elif [[ ${EUID} == 0 ]]; then
  echo "Don't run as root."
  exit 1
fi

sudo pacman -Sy --needed --noconfirm git git-crypt debugedit fakeroot

if ! pacman -Qi aconfmgr-git &>/dev/null; then
  tmpdir=$($prefix -- mktemp -d)
  $prefix -- git clone https://aur.archlinux.org/aconfmgr-git "${tmpdir}/aconfmgr"
  $prefix --chdir "${tmpdir}/aconfmgr" -- makepkg --noconfirm --needed -si
fi
if ! pacman -Qi 1password &>/dev/null; then
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
  tmpdir=$($prefix -- mktemp -d)
  $prefix -- git clone https://aur.archlinux.org/1password "${tmpdir}/1password"
  $prefix --chdir "${tmpdir}/1password" -- makepkg --noconfirm --needed -si
fi
