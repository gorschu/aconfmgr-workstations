# show recipes and exit
default:
  just --list

# apply aconfmgr config and execute subsequent internal recipes
apply: _aconfmgr _user-services

_aconfmgr:
  aconfmgr apply
  sudo mkinitcpio -P
  sudo locale-gen

_user-services:
  #!/usr/bin/env bash
  systemctl --user daemon-reload
  for service in atuin.service systemd-tmpfiles-setup.service; do
    systemctl --user enable --now "${service}"
  done

# find stray files in files/
stray-files:
  find files | sed 's_^files__g' | xargs -I{} sh -c 'grep -q "{}" *.sh || echo {}'
