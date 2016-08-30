
From the [Wikipedia page](https://en.wikipedia.org/wiki/Das_U-Boot), the free encyclopedia

Das U-Boot (Universal Bootloader) is an open source, primary boot loader used in embedded devices to package the instructions to boot the device's operating system kernel. It is available for a number of computer architectures, including 68k, ARM, AVR32, Blackfin, MicroBlaze, MIPS, Nios, SuperH, PPC and x86.

UDOO QUAD-DUAL ARM boards use Das U-Boot. This bootloader initializes the system, and loads kernel and file system to boot the OS.

## Install the required packages

Some packages are needed to compile the U-Boot for UDOO boards.
E.g. in Ubuntu 14.04 it is necessary to install the following packages:

    sudo apt-get update
    sudo apt-get install gawk wget git diffstat unzip texinfo gcc-multilib \
         build-essential chrpath socat libsdl1.2-dev xterm picocom ncurses-dev lzop \
         gcc-arm-linux-gnueabihf

## Get the kernel sources from GitHub

Download the latest U-Boot revision from GitHub:

```bash

git clone https://github.com/UDOOboard/uboot-imx
cd uboot-imx

```

To build the U-Boot for UDOO Quad/Dual, you can use the master [`2015.04-imx`](https://github.com/UDOOboard/uboot-imx) branch.
This branch is based on NXP&trade;/Freescale U-Boot fork project.

## Compile sources

The build can be started with:

```bash

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make udoo_qd_config
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make

```
The produced files, SPL and u-boot.img, can be used to boot both Quad and Dual boards.

## Flash/Install the U-Boot on a microSD

Unmount all the Micro SD partitions:

```bash

sudo umount /dev/<user_name>/boot
sudo umount /dev/<user_name>/rootfs

```

NOTE: Be sure you’ re using the correct device filename (/dev/sdX or /dev/mmcblkX); use of the wrong device identifier could result in the loss of all data on the Hard Drive of the host PC used.

Double check the filename of your device with command:

```bash

lsblk

```

Flash the files in the SD (e.g. /dev/sdb) card with:


```bash

sudo dd if=SPL of=/dev/mmcblk0 bs=1K seek=1
sudo dd if=u-boot.img of=/dev/mmcblk0 bs=1K seek=69

```
