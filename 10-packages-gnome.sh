# shellcheck shell=bash
if [[ " ${DESKTOPS[*]} " =~ gnome ]]; then
  AddPackage baobab # A graphical directory tree analyzer
  AddPackage decibels # Audio player for GNOME
  AddPackage epiphany # A GNOME web browser based on the WebKit rendering engine
  AddPackage gdm # Display manager and login screen
  AddPackage gnome-backgrounds # Background images and data for GNOME
  AddPackage gnome-calculator # GNOME Scientific calculator
  AddPackage gnome-calendar # Simple and beautiful calendar application designed to perfectly fit the GNOME desktop
  AddPackage gnome-characters # A character map application
  AddPackage gnome-clocks # Clocks applications for GNOME
  AddPackage gnome-color-manager # GNOME Color Profile Tools
  AddPackage gnome-connections # Remote desktop client for the GNOME desktop environment
  AddPackage gnome-console # A simple user-friendly terminal emulator for the GNOME desktop
  AddPackage gnome-contacts # Contacts Manager for GNOME
  AddPackage gnome-control-center # GNOME's main interface to configure various aspects of the desktop
  AddPackage gnome-disk-utility # Disk Management Utility for GNOME
  AddPackage gnome-font-viewer # A font viewer utility for GNOME
  AddPackage gnome-keyring # Stores passwords and encryption keys
  AddPackage gnome-logs # A log viewer for the systemd journal
  AddPackage gnome-maps # Find places around the world
  AddPackage gnome-menus # GNOME menu specifications
  AddPackage gnome-music # Music player and management application
  AddPackage gnome-remote-desktop # GNOME Remote Desktop server
  AddPackage gnome-session # The GNOME Session Handler
  AddPackage gnome-settings-daemon # GNOME Settings Daemon
  AddPackage gnome-shell # Next generation desktop shell
  AddPackage gnome-shell-extensions # Extensions for GNOME shell, including classic mode
  AddPackage gnome-shell-extension-appindicator # AppIndicator/KStatusNotifierItem support for GNOME Shell
  AddPackage gnome-shell-extension-caffeine # Extension for GNOME Shell to disable screensaver and auto suspend
  AddPackage gnome-shell-extension-dash-to-dock # Move the dash out of the overview transforming it in a dock
  AddPackage gnome-shell-extension-gsconnect # KDE Connect implementation with GNOME Shell integration
  AddPackage gnome-software # Allows you to find and install new apps
  AddPackage gnome-system-monitor # View current processes and monitor system state
  AddPackage gnome-text-editor # A simple text editor for the GNOME desktop
  AddPackage gnome-tour # Guided tour and greeter for GNOME
  AddPackage gnome-tweaks # Graphical interface for advanced GNOME 3 settings (Tweak Tool)
  AddPackage gnome-user-docs # User documentation for GNOME
  AddPackage gnome-user-share # Easy to use user-level file sharing for GNOME
  AddPackage gnome-weather # Access current weather conditions and forecasts
  AddPackage go-yq # Portable command-line YAML processor
  AddPackage grilo-plugins # A collection of plugins for the Grilo framework
  AddPackage gvfs # Virtual filesystem implementation for GIO
  AddPackage gvfs-afc # Virtual filesystem implementation for GIO - AFC backend (Apple mobile devices)
  AddPackage gvfs-dnssd # Virtual filesystem implementation for GIO - DNS-SD and WebDAV backend (macOS file sharing)
  AddPackage gvfs-goa # Virtual filesystem implementation for GIO - Gnome Online Accounts backend (e.g. OwnCloud)
  AddPackage gvfs-google # Virtual filesystem implementation for GIO - Google Drive backend
  AddPackage gvfs-gphoto2 # Virtual filesystem implementation for GIO - gphoto2 backend (PTP camera, MTP media player)
  AddPackage gvfs-mtp # Virtual filesystem implementation for GIO - MTP backend (Android, media player)
  AddPackage gvfs-nfs # Virtual filesystem implementation for GIO - NFS backend
  AddPackage gvfs-onedrive # Virtual filesystem implementation for GIO - Microsoft OneDrive backend
  AddPackage gvfs-smb # Virtual filesystem implementation for GIO - SMB/CIFS backend (Windows file sharing)
  AddPackage gvfs-wsdd # Virtual filesystem implementation for GIO - Web Services Dynamic Discovery backend (Windows discovery)
  AddPackage loupe # A simple image viewer for GNOME
  AddPackage malcontent # Parental control support for applications
  AddPackage nano # Pico editor clone with enhancements
  AddPackage nautilus # Default file manager for GNOME
  AddPackage network-manager-applet # Applet for managing network connections
  AddPackage orca # Screen reader for individuals who are blind or visually impaired
  AddPackage papers # Document viewer for PDF and other document formats aimed at the GNOME desktop
  AddPackage rygel # UPnP AV MediaServer and MediaRenderer
  AddPackage simple-scan # Simple scanning utility
  AddPackage snapshot # Take pictures and videos
  AddPackage sushi # A quick previewer for Nautilus
  AddPackage tecla # Keyboard layout viewer
  AddPackage totem # Movie player for the GNOME desktop based on GStreamer
  AddPackage vim # Vi Improved, a highly configurable, improved version of the vi text editor
  AddPackage vulkan-nouveau # Open-source Vulkan driver for Nvidia GPUs
  AddPackage xdg-desktop-portal-gnome # Backend implementation for xdg-desktop-portal for the GNOME desktop environment
  AddPackage xdg-user-dirs-gtk # Creates user dirs and asks to relocalize them
  AddPackage xf86-video-amdgpu # X.org amdgpu video driver
  AddPackage xf86-video-ati # X.org ati video driver
  AddPackage xf86-video-nouveau # Open Source 3D acceleration driver for nVidia cards
  AddPackage xorg-server # Xorg X server
  AddPackage xorg-xinit # X.Org initialisation program
  AddPackage yelp # Get help with GNOME

  AddPackage --foreign gnome-shell-extension-pano-git # Next-gen Clipboard Manager for Gnome Shell
  
  RemovePackage gnome-console
  RemovePackage evince

  CreateDir /etc/colord '' colord colord
  CreateDir /etc/gnome-remote-desktop '' gnome-remote-desktop gnome-remote-desktop
  CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/gdm.service
  CreateLink /etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket /usr/lib/systemd/user/gnome-keyring-daemon.socket
fi
