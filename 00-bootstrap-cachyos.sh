# shellcheck shell=bash
AconfNeedProgram pcregrep pcre n
AconfNeedProgram curl curl n

# install CachyOS repositories
if ! pacman -Qi cachyos-keyring &>/dev/null || ! pacman -Qi cachyos-mirrorlist &>/dev/null; then
  tmpdir=$(mktemp -d)
  curl -s -q https://mirror.cachyos.org/cachyos-repo.tar.xz | tar xfJ - -C "${tmpdir}"
  (cd "${tmpdir}/cachyos-repo" && sudo ./cachyos-repo.sh --install)
fi
