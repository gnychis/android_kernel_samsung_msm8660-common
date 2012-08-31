#!/bin/bash
make ARCH=arm clean
make ARCH=arm cyanogenmod_awmon_defconfig
make -j2 ARCH=arm CROSS_COMPILE=arm-eabi-
cd ../compat-wireless-3.0.9-1/
make clean
./scripts/driver-select rt2x00
KERNEL_DIR=$(pwd)/../sgs2-cm9-kernel
make ARCH=arm CROSS_COMPILE=arm-eabi- KLIB=$KERNEL_DIR KLIB_BUILD=$KERNEL_DIR "$@"
cd ../sgs2-cm9-kernel
./package.sh
