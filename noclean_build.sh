#!/bin/bash
make -j2 ARCH=arm CROSS_COMPILE=arm-eabi-
./package.sh
