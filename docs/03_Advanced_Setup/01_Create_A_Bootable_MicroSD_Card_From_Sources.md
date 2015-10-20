## Overview

Note: The following instructions are referred to a Linux system.

A bootable SD card has 3 different elements:
* Kernel
* U-Boot (Universal Bootloader)
* File System (e.g: UDOObuntu)

A possible way to create a bootable SD card consists in installing the elements separately from the binaries available on UDOO’ s website. Alternatively, it is possible to compile the source code in order to get the binaries.

This is especially useful for people that want to customize and improve the UDOO environment and getting the newest kernel/u-boot updates. This way is not usually suitable for beginners.

The following steps are required when using an unformatted microSD card:

## Download Binaries

Download all the necessary binaries that must be installed.

Create a development folder on Home:

```bash

cd mkdir udoo-dev


```

then move to the folder


```bash

cd udoo-dev

```

Download inside the “udoo-dev” folder the file system, the compiled Kernel (uImage) and the U-Boot file (u-boot.bin) for UDOO Dual or Quad from the binaries section of the website [http://www.udoo.org/downloads/](/downloads/). Once completed these steps, in “udoo-dev” folder there will be 3 binary files: File System, U-Boot and Kernel.

## Compile the Kernel and the modules

It’s possible to download the Kernel sources from the GitHub repository [https://github.com/UDOOboard/Kernel_Unico](https://github.com/UDOOboard/Kernel_Unico).

Note: For compiling the sources from an x86/64 PC, it is also necessary to download the cross-compiler from the sources section of the webpage [http://www.udoo.org/downloads/](/downloads/).

Download and extract the cross-compiler:

```bash

curl

http://download.udoo.org/files/crosscompiler/arm-fsl-linux-gnueabi.tar.gz |

tar -xzv

```

It could be prompted to install some packages in order to successfully compile the kernel on Linux.

E.g. in Ubuntu 10.04 it is necessary  to install the following packages:

```bash

sudo apt-get install build-essential ncurses-dev uboot-mkimage git

```

Download the latest revision from GitHub:

```bash

git clone http://github.com/UDOOboard/Kernel_Unico kernel

```

Move inside the folder kernel:

```bash

cd kernel

```

Set the default kernel configuration for UDOO by running the command:

```bash

make ARCH=arm UDOO_defconfig

```

At this point, it is possible to edit the config:

```bash

make ARCH=arm menuconfig

```

Start compiling:

```bash

make -j4

CROSS_COMPILE=../arm-fsl-linux-gnueabi/bin/arm-fsl-linux-gnueabi-ARCH=arm

uImage modules

```

(This operation could take up to 20 minutes, depending on the PC used) The compiled Binary (uImage) will now be available in the arch/arm/boot/ folder.

Copy it in the previous folder:

```bash

cp arch/arm/boot/uImage ..

```

Now install the modules:

```bash

make modules_install INSTALL_MOD_PATH=..

CROSS_COMPILE=../arm-fsl-linux-gnueabi/bin/arm-fsl-linux-gnueabi- ARCH=arm

cd ..

```

## Preparing the partitions on the SD card

Insert the microSD card in the card reader.

Launch gparted:

```bash

sudo gparted

```

Select the right microSD label from the drop down menu

NOTE: Be sure you’ re using the correct label; use of the wrong device identifier could result in the loss of all data on the Hard Drive of the host PC used. e.g.  /dev/sdc

Unmount and delete the existing microSD partitions (If necessary, create a partition table: Select from the top menu: Device → Create Partition Table... → Apply)

Create a new partition with the following parameters and press Add.

```bash

Free space preceding (MiB): 10
New size (MiB): based to the SD size
Free space following (MiB): 10
Create as: Primary partition
File system: ext3

```

(NOTE: ext4 is not yet supported)

Label: <UDOO_MICROSD_LABEL>

Press the green V form, wait for the partition to be done and exit gparted.

## Copy the files on the SD card File System

Note: Always remember to replace the strings inside the brackets with the right filenames.

Mount the just-created partition and then extract the tar.gz file containing the filesystem inside the microSD card with the following command:

```bash

sudo tar -xzvpf <NAME_OF_TAR_FS> -C /media/<UDOO_MICROSD_LABEL>/

```

(This operation could take up to 30 minutes)

Kernel Image:

Copy the binary inside the microSD card boot folder by using the following command:

```bash

sudo cp uImage/media/<UDOO_MICROSD_LABEL>/boot

```

### Installing kernel modules

Remove the previous modules:

```bash

sudo rm -rv /media/<UDOO_MICROSD_LABEL>/lib/modules/*

```

Copy the new modules:

```bash

sudo cp -av lib /media/<UDOO_MICROSD_LABEL>/

```

### Installing U-Boot

Unmount all the Micro SD partitions:

```bash

sudo umount /dev/<MICROSD_DEVICE_NAME>*

```

NOTE: Be sure you’ re using the correct device filename; use of the wrong device identifier could result in the loss of all data on the Hard Drive of the host PC used.

Double check the filename of your device with command:

```bash

lsblk

```

### Copy the u-boot binary file inside the MicroSD

For UDOO Quad:

```bash

sudo dd if=u-boot-q.imx of=/dev/sdX bs=512 seek=2

```

For UDOO Dual:

```bash

sudo dd if=u-boot-d.imx of=/dev/sdX bs=512 seek=2
sync

```

The microSD card is now ready. Simply insert it in UDOO’s microSD Card slot and boot the system.











