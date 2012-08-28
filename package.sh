#!/bin/bash
mkdir -p package_tree/system/etc/awmon_modules
rm -f initramfs/lib/modules/*
rm -f package_tree/system/etc/awmon_modules/*
rm -f package_tree/boot.img
find . -name "*.ko" -exec cp {} initramfs/system/lib/modules \;
./mkbootfs initramfs | gzip > ramdisk.gz
rm -f package_tree/system/etc/awmon_modules/*
cp arch/arm/boot/zImage .
./mkbootimg-sg2x --kernel zImage --ramdisk ramdisk.gz --cmdline "androidboot.hardware=qcom usb_id_pin_rework=true" -o boot.img --base 0x40400000 --pagesize 2048
cp boot.img package_tree
rm zImage
find ../compat-wireless-2012-05-10/ -name "*.ko" -exec cp {} package_tree/system/etc/awmon_modules/ \;
cd package_tree
zip -r ../sgs2_cm9_awmon.zip *
cd ../
