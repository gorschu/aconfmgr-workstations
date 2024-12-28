# shellcheck shell=bash
cat >"$(CreateFile /etc/cmdline.d/plymouth.conf)" <<EOF
splash
EOF
