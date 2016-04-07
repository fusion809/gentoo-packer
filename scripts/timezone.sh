#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
ln -snf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime
echo "Australia/Brisbane" > /etc/timezone
EOF
