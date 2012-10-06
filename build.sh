#!/bin/bash
export ARCH=arm
#export CROSS_COMPILE=`readlink -f ../os/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6`/bin/arm-linux-androideabi-
#export CROSS_COMPILE=`readlink -f ../os/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6`/bin/arm-eabi-
export CROSS_COMPILE=`readlink -f ../linaro-android-toolchain`/bin/arm-eabi-
#export CROSS_COMPILE=`readlink -f ../android-ndk-r9b-linux/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86`/bin/arm-linux-androideabi-
#export CROSS_COMPILE=`readlink -f ../android-ndk-r7b-linux/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86`/bin/arm-linux-androideabi-
make clean
make clean
make cyanogenmod_awmon_defconfig
make
./package.sh
