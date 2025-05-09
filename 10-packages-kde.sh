# shellcheck shell=bash
AddPackage ark                      # Archiving Tool
AddPackage dolphin                  # KDE File Manager
AddPackage kate                     # Advanced text editor
AddPackage kdeconnect               # Adds communication between KDE and your smartphone
AddPackage kdegraphics-thumbnailers # Thumbnailers for various graphics file formats
AddPackage kdialog                  # A utility for displaying dialog boxes from shell scripts
AddPackage kimageformats            # Image format plugins for Qt 6
AddPackage konsole                  # KDE terminal emulator
AddPackage kwalletmanager           # Wallet management tool
AddPackage gwenview                 # A fast and easy to use image viewer
AddPackage okular                   # Document Viewer
AddPackage plasma-meta              # Meta package to install KDE Plasma
AddPackage plasma-workspace         # KDE Plasma workspace
AddPackage qt6-multimedia-ffmpeg

CreateFile /etc/sddm.conf >/dev/null
CopyFile /etc/sddm.conf.d/kde_settings.conf

CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/sddm.service
