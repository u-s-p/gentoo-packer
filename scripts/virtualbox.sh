#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge "=virtual/linux-sources-3" --autounmask-write
etc-update --automode -5
emerge "=virtual/linux-sources-3"

emerge ">=app-emulation/virtualbox-guest-additions-6.0" --autounmask-write
etc-update --automode -5
emerge ">=app-emulation/virtualbox-guest-additions-6.0"

rc-update add virtualbox-guest-additions default
EOF
