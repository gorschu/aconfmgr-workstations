# shellcheck shell=bash
cat >"$(CreateFile /etc/cmdline.d/zswap.conf)" <<EOF
zswap.enabled=0
EOF
