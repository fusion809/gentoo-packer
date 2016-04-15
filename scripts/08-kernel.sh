#!/bin/bash

cp $SCRIPTS/scripts/kernel.config /mnt/gentoo/tmp/

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge --autounmask-write ">=sys-kernel/gentoo-sources-4.5.1"
etc-update --automode -5
emerge ">=sys-kernel/gentoo-sources-4.5.1"
emerge sys-kernel/genkernel
cd /usr/src/linux
mv /tmp/kernel.config .config
genkernel --install --symlink --oldconfig all
emerge -c sys-kernel/genkernel
EOF
