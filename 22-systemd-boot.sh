# shellcheck shell=bash
# systemd-boot wants /boot mounted as root-accessible only to secure the random-seed
sudo sed -i -r "s/fmask=([0-9]{4})/fmask=0177/" /etc/fstab
sudo sed -i -r "s/dmask=([0-9]{4})/dmask=0077/" /etc/fstab
# we have to manually set permissions to have aconfmgr not try to restore the defaults
CopyFile /boot/loader/loader.conf 600
SetFileProperty /boot/loader mode 700
SetFileProperty /boot mode 700
# TODO: Will arch/archinstall fix/change this?
