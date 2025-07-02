# shellcheck shell=bash
AddPackage networkmanager # Network connection manager and user applications

CopyFile "/etc/NetworkManager/system-connections/GoBa Packet Loss.nmconnection" 600
CopyFile "/etc/NetworkManager/system-connections/AZMODAN-f37ea388-a4b0-4531-a778-0d205493969e.nmconnection" 600
CopyFile "/etc/NetworkManager/system-connections/FritzBoxJH.nmconnection" 600
CopyFile "/etc/NetworkManager/system-connections/the brothel across the street.nmconnection" 600

CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service
