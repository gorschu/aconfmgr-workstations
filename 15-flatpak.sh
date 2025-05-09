# shellcheck shell=bash
AconfNeedProgram flatpak flatpak n

AddPackage xdg-desktop-portal-gtk # A backend implementation for xdg-desktop-portal using GTK

if ! flatpak remotes | grep -q "flathub.*user"; then
  flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi
