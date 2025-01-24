# show recipes and exit
default:
  just --list

# apply aconfmgr config and execute subsequent internal recipes
apply: _aconfmgr _user-services _add-printer

_aconfmgr:
  aconfmgr apply
  sudo mkinitcpio -P
  sudo locale-gen

_user-services:
  #!/usr/bin/env bash
  systemctl --user daemon-reload
  for service in atuin.service systemd-tmpfiles-setup.service msmtp-runqueue.timer; do
    systemctl --user enable --now "${service}"
  done

_add-printer:
  #!/usr/bin/env bash
  set -o pipefail
  lpstat -p 2>/dev/null | grep -q "Epson_WorkForce_Pro_WF-4830"
  if [[ "$?" -ne 0 ]]; then
    sudo lpadmin -p "Epson_WorkForce_Pro_WF-4830" -D "Epson WorkForce Pro WF-4830" -E -v lpd://172.29.50.7:515/PASSTHRU -P /usr/share/ppd/epson-inkjet-printer-escpr2/Epson-WF-4830_Series-epson-escpr2-en.ppd -o PageSize=A4 -o sides=one-sided
  fi

# find stray files in files/
stray-files:
  find files | sed 's_^files__g' | xargs -I{} sh -c 'grep -q "{}" *.sh || echo {}'
