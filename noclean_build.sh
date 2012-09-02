#!/bin/bash
make -j2 ARCH=arm CROSS_COMPILE=arm-eabi-
cd ../compat-wireless-3.5.1-1/
make clean
./scripts/driver-select restore
./scripts/driver-select brcm80211
KERNEL_DIR=$(pwd)/../sgs2-cm9-kernel
make ARCH=arm CROSS_COMPILE=arm-eabi- KLIB=$KERNEL_DIR KLIB_BUILD=$KERNEL_DIR "$@"
cd ../sgs2-cm9-kernel
./package.sh
