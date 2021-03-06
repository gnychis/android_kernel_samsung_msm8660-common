#!/bin/bash
rm -f sgs2_cm9_awmon.zip
rm -f initramfs/lib/modules/*
rm -f package_tree/system/lib/modules/*
rm -f package_tree/boot.img
find . -name "*.ko" -exec cp {} package_tree/system/lib/modules \;
./mkbootfs initramfs | gzip > ramdisk.gz
cp arch/arm/boot/zImage .
./mkbootimg-sg2x --kernel zImage --ramdisk ramdisk.gz --cmdline "androidboot.hardware=qcom usb_id_pin_rework=true" -o boot.img --base 0x40400000 --pagesize 2048
cp boot.img package_tree
rm zImage
find ../compat-wireless-3.0.9-1/ -name "*.ko" -exec cp {} package_tree/system/lib/modules/ \;
cd package_tree
zip -r ../sgs2_cm9_awmon.zip *
cd ../
