# shellcheck shell=bash
AddPackage dolphin                  # KDE File Manager
AddPackage kdeconnect               # Adds communication between KDE and your smartphone
AddPackage kdegraphics-thumbnailers # Thumbnailers for various graphics file formats
AddPackage konsole                  # KDE terminal emulator
AddPackage plasma-meta              # Meta package to install KDE Plasma
AddPackage qt6-multimedia-ffmpeg

CreateFile /etc/sddm.conf >/dev/null
CopyFile /etc/sddm.conf.d/kde_settings.conf

CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/sddm.service
