This describes the necessary steps to start and use the pre-compiled Android software support package for UDOO DUAL/QUAD Board. Moreover, a description of how to rebuild the bootloader, kernel and Android file system is provided. The procedure described in this wiki refers to UDOO DUAL/QUAD.

## System Requirements

Android system for UDOO DUAL/QUAD board is provided as precompiled images or as source code to be customized and rebuilt. Running the full procedure described in this wiki, rebuilding the Android system from source files, it is necessary to have an host PC (or Virtual Machine) running Ubuntu Linux 10.04 64bit with at least 40 GB of free disk space, configured in the set up the work environment section below. The host PC should also include:

* an SD/µSD card reader;
* an host pc with internet connection;
* a microUSB cable to connect UDOO DUAL/QUAD to host and access debug serial (optional);

### Terminology

The set of scripts and images necessary to run Android on a board is generically called a Distro.

## Setting up a Linux build environment

Regarding the development environment, you need to first make sure to comply with the `AOSP` (Android Open Source Project) requirements. Note that it requires a `64-bit` version of `Linux`. Follow this official link for [Establishing a Build Environment](https://source.android.com/source/initializing.html).

We suggest to use a Virtual Machine environment to create a close and dedicated workspace. It reduce risks of procedure and libraries mismatching or to corrupt other working enviroments present on the host machine.

Building 5.x Lollipop and 6.0.x Marshmallow versions for UDOO QUAD/DUAL only requires to have `OpenJDK v7` (the v8 as specified in the official Android docs is required only to compile the next Android N).

    ~$ sudo apt-get install openjdk-7-jdk

The packages needed to build the AOSP
In addition to the AOSP requirements, the following packages are needed to build NXP/Freescale components:

    ~$ sudo apt-get install uuid uuid-dev zip lzop gperf zlib1g-dev \
    liblz-dev liblzo2-2 liblzo2-dev u-boot-tools lib32z1 flex git-core \
    curl mtd-utils android-tools-fsutils

At this page you can find how to [create a Virtual Machine for Development](../Advanced_Topics/Setup_Development_Environment.html). Remember you need a 64 bit Linux Distro to compile Android.

## Serial communication

While not exactly necessary, serial communication with UDOO DUAL/QUAD is strongly recommended as the first debug method. In order to use the serial debug port on UDOO DUAL/QUAD, after connecting the board and host PC ports, it is necessary to install and setup an application for serial communication, such as minicom. At this page you can find how to [Conecting via Serial Cable](../Basic_Setup/Connecting_Via_Serial_Cable.html).

The serial debug port is used for two different reasons: The bootloader and kernel send debug messages via serial port, so that the user can monitor the low level system state; a root console is opened on the serial port, allowing bootloader configuration and system control.

The number of messages sent via serial port can be very high. For this reason, it is quite useful to increase scrolling capabilities of the terminal, possibly setting them to a very high or even unlimited.

## Download the source code

Next step is downloading the source code. To do so you need the [`repo`](https://source.android.com/source/using-repo.html) tool which has been developed especially for Android in order to manage the hundreds of Git repositories this project contains:

    ~$ cd ~
    ~$ mkdir myandroid bin
    ~$ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    ~$ chmod a+x ~/bin/repo
    ~$ cd myandroid
    ~$ ~/bin/repo init -u https://github.com/UDOOboard/android_udoo_platform_manifest -b android-6.0.1
    ~$ ~/bin/repo sync -j5

N.B. the `repo sync` loads the repos needed. Therefore, it can take several hours to load. The `-jN` command run `N` tasks at the same time to speed up this process.

## Configure the environment

Prior to build the system, it is necessary to configure the Android environment for the specific build. In particular, the following commands have to be launched:

```bash

~$ export ARCH=arm
~$ source build/envsetup.sh

```

Finally, it is necessary to choose which target to build. The command below shows a list of possible targets

```bash

~$ lunch

```

For each possible target, the first part of the name indicates the board you are building for, while the second part selects the build type, as described [here](http://source.android.com/source/building.html).

In particular, valid options to build for UDOO DUAL/QUAD board are:

* udoo_6dq-user: build for production, with limited access
* udoo_6dq-eng: build for development, with root access and additional debugging tools

The target selection can alternatively be done directly at command line, calling for example

```bash

~$ lunch udoo_6dq-eng

```

Once all these steps are done, several environment variables are set. Among the rest, it is worth noting the environment variable OUT, automatically set to `udoo-android-dev]/out/target/product/udoo_6dq`, that is the folder where Android system is actually built, and where object files, folders and system images are created. From now on, this folder is called [OUT].

## Build Android system image

The easiest but most time-consuming step in building Android is to build the Android system image. In general, after configuring the environment as in configuration section, it is sufficient to launch the following command (from the main folder [udoo-android-dev]) to build the whole system image, including the kernel:

The code:

```bash

~$ make

```

The duration of the whole system build is strongly dependent on the host PC you are working on, but this can take up to several hours, and builds more than 20GB of compiled code (this is the size of the [udoo-android-dev]/out/ folder when the operation is completed). Enabling parallel compilation can speed up the process.

In general, the idea is to let the compiler to launch several compiling jobs in parallel, where the number of jobs depends on the specific PC you are working on.

```bash

~$ make -jN

```

where N is the maximum number of parallel jobs allowed. For a better explanation of this point (included the value to assign to N), please consult  [http://source.android.com/source/building.html](http://source.android.com/source/building.html), in Build the Code section above.

Several files and folders are created in [OUT]. Among the rest we underline:

* root/ and ramdisk.img: root file system and generated image
* recovery/ and ramdisk-recovery.img: root file system used in recovery mode, and generated image
* system/ and system.img: Android system including binaries and libraries, and generated image
* data/ and userdata.img: Android data area and generated image
* kernel and uImage: kernel images
* boot.img: kernel and initial root ramdisk, generated from kernel and ramdisk.img
* recovery.img: kernel and initial root ramdisk used in recovery mode, generated from kernel and ramdisk-recovery.img
* u-boot.imx: the U-Boot bootloader. This is the first executed binary that loads the kernel and all the system.

The images are sufficient to boot UDOO DUAL/QUAD board with the default kernel configuration.

## Create a microSD from the Android built files

Once the new Android system images are created, it is necessary to prepare a µSD card with the images and boot UDOO DUAL/QUAD board. A script is provided to help with this step. In a way similar to what is described in the Run Android section, the script will partition and format the SD card and then copies the new Android images into the correct partitions, reading them directly from [$OUT]. It is sufficient to follow the next steps.

Connect the SD card to your host PC, and use the `dmesg` or `fdisk -l` commands to find the device name; we suppose it is /dev/sdc.

Launch the script to prepare the SD

```bash

~# cp make_sd.sh $OUT
~# cd $OUT
~# sudo -E ./make_sd.sh /dev/sdc

```

When this is done, the SD card containing the images is ready to boot UDOO DUAL/QUAD as described in the Boot Android from SD section.

## Prepare a Distro

It is sometimes useful to prepare a new Distro to be stored.

To do this, once the new images are built following the procedures described in the previous Sections, it is sufficient to call the command

```bash

~$ ./prepare_distro.sh [distro_name]

```

The script creates a new folder [distro_name], containing the freshly built Android system images, and the scripts to use them. An archive [distro_name].tar.gz is also prepared for distribution. Once the archive is ready, you can follow the above section to create a microSD from the Android built files.

## Boot Android from microSD

When the `make_sd` script ends, insert the SD into the SD card slot and power up the device. The Android system boots. You can see the Android bootscreen on a connected HDMI monitor within 20 seconds, while messages on the serial debug port start to be sent almost immediately. First of all, messages from the bootloader can be seen. Among the rest, characteristics of the board are shown: CPU type, boot device and memory size. Please check the correctness of this information. The kernel is automatically launched after a 3 second countdown. The first time Android System boots, it must configure the storage amd prepare folders for data and applications. As a consequence, every time the SD is prepared with the procedure described in this section, the first boot takes around 1 minute, while subsequent boots are much faster. At the end of the boot procedure, you can interact with the system either with mouse and keyboard and the HDMI display, or with a root console automatically opened in serial.

### Build Kernel

The kernel is built together with the rest of the Android system. However, it is also possible to modify the configuration and rebuild it separately. As for the bootloader, the kernel can be configured and customized for a very wide range of boards and peripherals. Linux kernel customization is a very complex task, an in-depth description is out of the scope of this document. Here we consider only the default configuration to run linux kernel on UDOO DUAL/QUAD board.

It is possible to configure (or restore) the kernel to the default configuration for the Module calling the command below:

The command:

```bash

~$ make -C kernel_imx udoo_quad_dual_android_defconfig

```

If you wish to check the configuration or customize it, use

```bash

~$ make -C kernel_imx menuconfig

```

The command opens a graphical configuration tool. Any saved change is stored in the same folder as an hidden file called .config, which then is the actual configuration file used to compile the kernel.

Once the configuration is ready, the kernel is compiled with command

```bash

~$ make bootimage

```

This operation can take up to 30 minutes to complete, and performs several actions:

* builds the kernel, creating the images uImage and zImage in [udoo-android-dev]/kernel_imx/arch/arm/boot
* copies the kernel images in [OUT] (zImage is renamed to kernel)
* updates root/ and ramdisk.img
* updates boot.img from ramdisk.img and kernel

When it is done, the new boot.img is present in [OUT], ready to be used to boot the Module.
Android Build system caches most of the file compiled, sometimes it may happen that some changes aren't reported in the final compiled boot.img. If this happens we suggest to delete from the $OUT folder these file: `boot.img`, `kernel`, `obj/KERNEL_OBJ/*` in order to recompile all the Kernel.
