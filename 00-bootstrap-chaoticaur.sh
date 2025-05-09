# shellcheck shell=bash
AconfNeedProgram pcregrep pcre n
AconfNeedProgram curl curl n

# install and enable ChaoticAUR
if ! pacman-key --list-keys 3056513887B78AEB &>/dev/null; then
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
fi
if ! pacman -Qi chaotic-keyring &>/dev/null || ! pacman -Qi chaotic-mirrorlist &>/dev/null; then
  sudo pacman --noconfirm --needed -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman --noconfirm --needed -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
fi
if ! pcregrep -q -M '^\[chaotic-aur\]\nInclude = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf; then
  sudo tee -a "/etc/pacman.conf" >/dev/null <<'EOF'
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
  sudo pacman --noconfirm -Sy
fi

# install CachyOS repositories
if ! pacman -Qi cachyos-keyring &>/dev/null || ! pacman -Qi cachyos-mirrorlist &>/dev/null; then
  tmpdir=$(mktemp -d)
  curl -s -q https://mirror.cachyos.org/cachyos-repo.tar.xz | tar xfJ - -C "${tmpdir}"
  (cd "${tmpdir}/cachyos-repo" && sudo ./cachyos-repo.sh --install)
fi
