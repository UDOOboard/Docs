## Overview

Note: The following instructions are referred to a Linux system.

A bootable SD card has 3 different elements:
* Kernel
* U-Boot (Universal Bootloader)
* File System (e.g: UDOObuntu)

A possible way to create a bootable SD card consists in installing the elements separately from the binaries available on UDOO’ s website. Alternatively, it is possible to compile the source code in order to get the binaries.

This is especially useful for people that want to customize and improve the UDOO DUAL/QUAD environment and getting the newest kernel/u-boot updates. This way is not usually suitable for beginners.

The following steps are required when using an unformatted microSD card:

## Download Binaries

Download all the necessary binaries that must be installed.

Create a development folder on Home:

```bash

mkdir udoo-dev


```

then move to the folder


```bash

cd udoo-dev

```

Download inside the “udoo-dev” folder the file system, the U-Boot file (u-boot.imx) for UDOO DUAL/QUAD from the binaries section of the website [http://www.udoo.org/other-resources/](/other-resources/). Once completed these steps, in “udoo-dev” folder there will be 3 binary files: File System, U-Boot and Kernel.

## Compile the Linux Kernel and the modules

It’s possible to download the Kernel sources from the GitHub repository [https://github.com/UDOOboard/linux_kernel](https://github.com/UDOOboard/linux_kernel).

It could be prompted to install some packages in order to successfully compile the kernel on Linux.

E.g. in Ubuntu 14.04 it is necessary  to install the following packages:

```bash

sudo apt-get install build-essential ncurses-dev u-boot-tools git gcc-arm-linux-gnueabihf 

```

Download the latest kernel revision from GitHub:

```bash

git clone https://github.com/UDOOboard/linux_kernel

```

Move inside the folder linux_kernel:

```bash

cd linux_kernel

```

Set the default kernel configuration for UDOO DUAL/QUAD by running the command:

```bash

make ARCH=arm udoo_quad_dual_defconfig

```

At this point, it is possible, if you need, to edit the config (optional):

```bash

make ARCH=arm menuconfig

```

Start compiling the Kernel, modules and dtb files:

```bash

make -j4 CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm zImage modules dtbs


```

(This operation could take up to 20 minutes, depending on the PC used) The compiled Binary (zImage) will now be available in the arch/arm/boot/ folder.

Modules and firmwares will be installed later, you can remain in this kernel folder.

## Preparing the partitions on the SD card

Insert the microSD card in the card reader.

Launch gparted:

```bash

sudo gparted

```

Select the right microSD label from the drop down menu

NOTE: Be sure you’ re using the correct label; use of the wrong device identifier could result in the loss of all data on the Hard Drive of the host PC used. e.g.  /dev/sdc

Unmount and delete the existing microSD partitions (If necessary, create a partition table: Select from the top menu: Device → Create Partition Table... → Apply)

Create two new partition with the following parameters and press Add.

```bash

Free space preceding (MiB): 5
New size (MiB): 50
Free space following (MiB): 0
Create as: Primary partition
label: boot
File system: fat16

Free space preceding (MiB): 0
New size (MiB): based to the SD size
Free space following (MiB): 0
Create as: Primary partition
label: rootfs
File system: ext4

```
Press the green V form, wait for the partition to be done and exit gparted.

## Copy the files on the SD card File System

Note: Always remember to replace the strings inside the brackets with the right filenames.

Mount the just-created partitions and then extract the tar.gz file containing the filesystem inside the microSD card with the following command:

```bash

sudo tar -xzvpf <NAME_OF_TAR_FS> -C /media/<user_name>/rootfs/

```

(This operation could take up to 30 minutes)

Kernel Image:

Copy the kernel binary and device tree files inside the microSD card boot folder by using the following commands:

```bash

cp arch/arm/boot/zImage /media/<user_name>/boot/
mkdir /media/<user_name>/boot/dts/
cp arch/arm/boot/dts/imx*udoo*.dtb /media/<user_name>/boot/dts/

```

### Installing kernel modules

Remove the previous modules:

```bash

sudo rm -rv /media/<user_name>/rootfs/lib/modules/*

```

Install the new firmwares and modules (from the kernel folder):

```bash

make firmware_install modules_install INSTALL_MOD_PATH=/media/<user_name>/rootfs/ CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm

```

### Compiling and Installing U-Boot


Download the latest U-Boot revision from GitHub:

```bash

git clone https://github.com/UDOOboard/uboot-imx

```

Move inside the folder uboot-imx:

```bash

cd uboot-imx

```

To build the U-Boot for UDOO Quad/Dual, use the 2015.10.fslc-qdl branch. This branch is based on Freescale Community's U-Boot (uboot-fslc) version 2015.10.

```bash

git checkout 2015.10.fslc-qdl

```

The build can be started with:

```bash

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make udoo_qdl_config
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make

```
The produced files, SPL and u-boot.img, can be used to boot both Quad and Dual boards.

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


The microSD card is now ready. Simply insert it in UDOO DUAL/QUAD’s microSD Card slot and boot the system.











