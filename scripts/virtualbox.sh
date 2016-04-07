#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge "=virtual/linux-sources-1" --autounmask-write
etc-update --automode -5
emerge "=virtual/linux-sources-1"

emerge ">=app-emulation/virtualbox-guest-additions-$VBGA" --autounmask-write
etc-update --automode -5
emerge ">=app-emulation/virtualbox-guest-additions-$VBGA"

rc-update add virtualbox-guest-additions default
EOF
