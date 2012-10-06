#!/bin/bash
export ARCH=arm
export CROSS_COMPILE=`readlink -f ../os/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6`/bin/arm-linux-androideabi-
make -j2
./package.sh
