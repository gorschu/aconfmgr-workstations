# shellcheck shell=bash
AddPackage --foreign vuescan-bin       # A powerful proprietary scanning tool developed by Hamrick Software
AddPackage cups                        # OpenPrinting CUPS - daemon package
AddPackage cups-pdf                    # PDF printer for cups
AddPackage epson-inkjet-printer-escpr2 # Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux

IgnorePath '/etc/cups/*'
IgnorePath '/etc/printcap'
CreateLink /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
