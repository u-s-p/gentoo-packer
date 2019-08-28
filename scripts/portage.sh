#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync
EOF

chroot /mnt/gentoo /bin/bash <<'EOF'
echo 'EMERGE_DEFAULT_OPTS="--quiet-build=y"' >> /etc/portage/make.conf
EOF
