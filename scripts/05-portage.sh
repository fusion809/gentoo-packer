#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync
sed -i -e 's/USE="bindist mmx sse sse2"/USE="-bindist mmx sse sse2"/g' /etc/portage/make.conf
echo 'ACCEPT_KEYWORDS="~amd64"' >> /etc/portage/make.conf
EOF
