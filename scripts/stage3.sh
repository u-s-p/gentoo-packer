#!/bin/bash

tarball=stage3-amd64-nomultilib-$STAGE3.tar.xz

mount /dev/sda4 /mnt/gentoo

cd /mnt/gentoo
wget --progress=dot:giga http://distfiles.gentoo.org/releases/amd64/autobuilds/$STAGE3/$tarball
tar xJpf $tarball
rm -f $tarball
