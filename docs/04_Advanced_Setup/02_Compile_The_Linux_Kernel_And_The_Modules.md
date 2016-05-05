## Compile the Linux Kernel and the modules

It’s possible to download the Kernel sources from the GitHub repository [https://github.com/UDOOboard/linux_kernel](https://github.com/UDOOboard/linux_kernel).

It could be prompted to install some packages in order to successfully compile the kernel on Linux.

E.g. in Ubuntu 14.04 it is necessary to install the following packages:

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

You can copy the kernel binary (zImage) and device tree binaries (.dtb) in the /boot/ partitions of your distro :

```bash
e.g.
cp arch/arm/boot/zImage /media/<user_name>/boot/
cp arch/arm/boot/dts/imx*udoo*.dtb /media/<user_name>/boot/dts/

```

Now install the modules and firmware in the UDOO rootfs:

```bash
e.g.
make modules_install firmware_install INSTALL_MOD_PATH=/media/<user_name>/udoobuntu/ CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm

```
