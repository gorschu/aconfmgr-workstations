# shellcheck shell=bash
AddPackage brightnessctl               # Lightweight brightness control tool
AddPackage ddcutil                     # Query and change Linux monitor settings using DDC/CI and USB.
AddPackage hypridle                    # hyprland’s idle daemon
AddPackage hyprland                    # a highly customizable dynamic tiling Wayland compositor
AddPackage hyprlock                    # hyprland’s GPU-accelerated screen locking utility
AddPackage hyprpolkitagent             # Simple polkit authentication agent for Hyprland, written in QT/QML
AddPackage hyprsunset                  # An application to enable a blue-light filter on Hyprland
AddPackage shikane                     # Deterministic dynamic output configuration tool for Wayland compositors
AddPackage swww                        # A Solution to your Wayland Wallpaper Woes
AddPackage uwsm                        # A standalone Wayland session manager
AddPackage wf-recorder                 # Screen recorder for wlroots-based compositors such as sway
AddPackage xdg-desktop-portal-hyprland # xdg-desktop-portal backend for hyprland

AddPackage --foreign ags-hyprpanel-git # A Bar/Panel for Hyprland with extensive customizability
AddPackage --foreign hyprswitch        # A CLI/GUI that allows switching between windows in Hyprland
AddPackage --foreign walker-bin        # wayland application runner

CopyFile /etc/systemd/logind.conf.d/laptoplid.conf # handle suspend for Hyprland
