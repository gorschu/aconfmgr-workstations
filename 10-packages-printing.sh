# shellcheck shell=bash
function CupsPrinterConfFilter() {
  grep -v '^StateTime' | grep -v "^Attribute marker-"
}

AddPackage --foreign vuescan-bin       # A powerful proprietary scanning tool developed by Hamrick Software
AddPackage cups                        # OpenPrinting CUPS - daemon package
AddPackage cups-pdf                    # PDF printer for cups
AddPackage epson-inkjet-printer-escpr2 # Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux

CopyFile /etc/cups/ppd/EPSON_WF-4830_Series.ppd 640 '' cups
CopyFile /etc/cups/ppd/EPSON_WF-4830_Series.ppd.O 640 '' cups

AddFileContentFilter '/etc/cups/printer.conf' CupsPrinterConfFilter
CopyFile /etc/cups/printers.conf 600
CopyFile /etc/cups/printers.conf.O 600 '' cups

CreateLink /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
SetFileProperty /etc/cups/classes.conf mode 600
