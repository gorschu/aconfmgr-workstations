agilebitskey="3FEF9748469ADBE15DA7CA80AC2D62742012EA22"
if ! gpg --list-key "${agilebitskey}" &>/dev/null; then
  gpg --receive-keys "${agilebitskey}"
fi
AddPackage 1password # Password manager and secure wallet
AddPackage --foreign 1password-cli

SetFileProperty /opt/1Password/1Password-BrowserSupport group onepassword
SetFileProperty /opt/1Password/1Password-BrowserSupport mode 2755
