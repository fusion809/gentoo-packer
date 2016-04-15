#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge "=virtual/linux-sources-1"
emerge ">=app-emulation/virtualbox-guest-additions-5.0.16" --autounmask-write
etc-update --automode -5
emerge ">=app-emulation/virtualbox-guest-additions-5.0.16"

rc-update add virtualbox-guest-additions default
EOF
