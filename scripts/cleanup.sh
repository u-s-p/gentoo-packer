#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cd /usr/src/linux && make clean
emerge -C sys-kernel/gentoo-sources
emerge --depclean
EOF

rm -rf /mnt/gentoo/usr/portage
rm -rf /mnt/gentoo/tmp/*
rm -rf /mnt/gentoo/var/log/*
rm -rf /mnt/gentoo/var/tmp/*

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge "sys-fs/zerofree" --autounmask-write
etc-update --automode -5
emerge "sys-fs/zerofree"
EOF

mv /mnt/gentoo/sbin/zerofree ./

mount -o remount,ro /mnt/gentoo
./zerofree /dev/sda4

swapoff /dev/sda3
dd if=/dev/zero of=/dev/sda3
mkswap /dev/sda3
