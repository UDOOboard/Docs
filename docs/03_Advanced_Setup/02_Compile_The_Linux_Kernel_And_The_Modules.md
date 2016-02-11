## Compile the Linux Kernel and the modules

It’s possible to download the Kernel sources from the GitHub repository [https://github.com/UDOOboard/Kernel_Unico](https://github.com/UDOOboard/Kernel_Unico).

Note: For compiling the sources from an x86/64 PC, it is also necessary to download the cross-compiler from the sources section of the webpage [http://www.udoo.org/other-resources/#sources](http://www.udoo.org/other-resources/#sources).

Download and extract the cross-compiler:

```bash

curl http://download.udoo.org/files/crosscompiler/arm-fsl-linux-gnueabi.tar.gz | tar -xzv

```

It could be prompted to install some packages in order to successfully compile the kernel on Linux.

E.g. in Ubuntu 10.04 it is necessary  to install the following packages:

```bash

sudo apt-get install build-essential ncurses-dev u-boot-tools git 

```

Download the latest revision from GitHub:

```bash

git clone http://github.com/UDOOboard/Kernel_Unico kernel

```

Move inside the folder kernel:

```bash

cd kernel

```

Set the default kernel configuration for UDOO DUAL/QUAD by running the command:

```bash

make ARCH=arm UDOO_defconfig

```

At this point, it is possible, if you need, to edit the config (optional):

```bash

make ARCH=arm menuconfig

```

Start compiling:

```bash

make -j4 CROSS_COMPILE=../arm-fsl-linux-gnueabi/bin/arm-fsl-linux-gnueabi- ARCH=arm uImage modules


```

(This operation could take up to 20 minutes, depending on the PC used) The compiled Binary (uImage) will now be available in the arch/arm/boot/ folder.

Copy it in the previous folder:

```bash

cp arch/arm/boot/uImage ..

```

Now install the modules:

```bash

make modules_install INSTALL_MOD_PATH=.. CROSS_COMPILE=../arm-fsl-linux-gnueabi/bin/arm-fsl-linux-gnueabi- ARCH=arm

cd ..

```