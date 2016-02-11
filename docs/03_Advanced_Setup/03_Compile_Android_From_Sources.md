This wiki describes the necessary steps to start and use the pre-compiled Android software support package for UDOO DUAL/QUAD Board. Moreover, a description of how to rebuild the bootloader, kernel and Android file system is provided. The procedure described in this wiki refers to UDOO DUAL/QUAD.

##System Requirements

Android system for UDOO DUAL/QUAD board is provided as precompiled images or as source code to be customized and rebuilt. Running the full procedure described in this wiki, rebuilding the Android system from source files, it is necessary to have an host PC (or Virtual Machine) running Ubuntu Linux 10.04 64bit with at least 40 GB of free disk space, configured in the set up the work environment section below. The host PC should also include:

* an SD/µSD card reader;
* a microUSB cable to connect UDOO DUAL/QUAD to host and access debug serial;
* an host pc with internet connection;

###Terminology

The set of scripts and images necessary to run Android on a board is generically called a Distro.

##Set up the work environment

Given an host PC (or Virtual Machine) running Ubuntu Linux 10.04 64bit with at least 40 GB of free disk space, it is required to install all the necessary packages for a standard Android build, as reported on the Android website at http://source.android.com/source/initializing.html.

We suggest to use a Virtual Machine environment to create a close and dedicated workspace. It reduce risks of procedure and libraries mismatching or to corrupt other working enviroments present on the host machine.

This wiki shows how to [create a Virtual Machine for Android Development](/docs/Tutorials/Create_A_Virtual_Machine_For_UDOO_Development)

##Serial communication

While not exactly necessary, serial communication with UDOO DUAL/QUAD is strongly recommended as the first debug method. In order to use the serial debug port on UDOO DUAL/QUAD, after connecting the board and host PC ports, it is necessary to install and setup an application for serial communication, such as minicom, cutecom or gtkterm (to mention only the most famous). There is no specific requirement on the application to use, here we only consider minicom, but settings for the others are equivalent.

Install minicom

```bash

HOST$ sudo apt-get install minicom

```

Launch minicom in setup mode (and with Linewrap ON, not necessary but useful)

```bash

HOST$ sudo minicom -sw

```

Select “Serial port setup” and check the following parameters

* Serial Device, option A (usually, /dev/ttyS0 or /dev/ttyUSB0 in case an USB adapter is used)
* Communications parameters, option E (must be 115200 8N1)
* No flow control, neither hardware nor software, options F and G

Save the settings as default.

Exit closes setup and opens minicom, instead “Exit from minicom” completely closes minicom, and you have to run it again without setup options

```bash

HOST$ sudo minicom -w

```

##Run Android

Right now the Android OS can boot only from a Micro SD. Here we consider only to boot UDOO DUAL/QUAD from the external SD present on board. In order to install and run a Distro on UDOO DUAL/QUAD, it is sufficient to prepare an SD with the Android system images, connect it to the board and power up the board.

###Notes on the prebuilt images

In order to simplify packages distribution and use, the bootloader prebuilt images are compiled for only a set of the possible configurations, allowing anyway to boot any platform. In particular, we provide:

* prebuilt images for UDOO DUAL and 1 GB of DDR
* prebuilt images for UDOO QUAD and 1 GB of DDR

###Boot Android from SD

When the script ends, insert the SD into the SD card slot and power up the device. The Android system boots. You can see the Android bootscreen on a connected HDMI monitor within 20 seconds, while messages on the serial debug port start to be sent almost immediately. First of all, messages from the bootloader can be seen. Among the rest, characteristics of the board are shown: CPU type, boot device and memory size. Please check the correctness of this information. The kernel is automatically launched after a 3 second countdown. The first time Android System boots, it must configure the storage amd prepare folders for data and applications. As a consequence, every time the SD is prepared with the procedure described in this section, the first boot takes around 1 minute, while subsequent boots are much faster. At the end of the boot procedure, you can interact with the system either with mouse and keyboard and the HDMI display, or with a root console automatically opened in serial.

The serial debug port is used for two different reasons: The bootloader and kernel send debug messages via serial port, so that the user can monitor the low level system state; a root console is opened on the seriaI port, allowing bootloader configuration and system control.

The number of messages sent via serial port can be very high. For this reason, it is quite useful to increase scrolling capabilities of the terminal, possibly setting them to a very high or even unlimited.

##Build Android

For a better tune-up of the system, it is possible to build the Android system images from scratch, rather than use the precompiled images.

Create a folder and get the source code, download tar file containing sources from http://www.udoo.org/downloads/

```bash

HOST# cd [udoo-android-dev]
HOST# tar –xzvpf UDOO_Android-4.3_Source_v2.0.tar.gz

```

It take up to an hour to download files from git. [udoo-android-dev] contain Androids sources and a series of scripts that helps in configuring the environment, building the system and preparing a new set of images to be run on UDOO DUAL/QUAD Board (following again the procedure described in Run Android section).

In order to build the whole system, it is necessary to

* configure the environment
* build the bootloader (u-boot)
* build kernel and Android system

Each step is considered separately.

###Configure the environment

Prior to build the system, it is necessary to configure the Android environment for the specific build. In particular, the following commands have to be launched:

```bash

HOST$ export ARCH=arm
HOST$ export CROSS_COMPILE=$PWD/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-
HOST$ export PATH=$PWD/bootable/bootloader/u-boot-imx/tools:$PATH
HOST$ source build/envsetup.sh

```

Finally, it is neces sary to choose which target to build. The command below shows a list of possible targets

```bash

HOST$ lunch

```

For each possible target, the first part of the name indicates the board you are building for, while the second part selects the build type, as described at http://source.android.com/source/building-running.html.

In particular, valid options to build for UDOO DUAL/QUAD board are:

* udoo-user: build for production, with limited access
* udoo-eng: build for development, with root access and additional debugging tools

The target selection can alternatively be done directly at command line, calling for example

```bash

HOST$ lunch udoo-eng

```

Once all these steps are done, several environment variables are set. Among the rest, it is worth noting the environment variable OUT, automatically set to [udoo-android-dev]/out/target/product/udoo, that is the folder where Android system is actually built, and where object files, folders and system images are created. From now on, this folder is called [OUT].

For everyday development, a command list is provided that automatically launches all the commands above:

```bash

HOST$ . setup udoo-eng

```

or alternatively

```bash

HOST$ . setup udoo-user

```

###Build u-boot

Move to the folder where bootloader sources are located, with command

```bash

HOST$ cd [udoo-android-dev]/bootable/bootloader/uboot-imx

```

The sources can be compiled for different boards, modules and OS. A script is provided to guide u boot compilation, and help in configuring the bootloader for the specific Module and system characteristics. It is sufficient to launch the following command to run the script for configuration.

Note that you need to have dialog package installed before being able to see textual menus.

```bash

HOST$ ./compile.sh -c

```

In a graphical menu, it is possible to choose some compilation options: The following settings are allowed:

* **DDR Size:** 1 options are given GB with bus size 64 (4 banks, each of 256 MB)
* **Board Type:** Udoo must be chosen.
* **CPU Type:** refers to i.MX6 specific CPU, values are Quad and Dual.
* **OS Type:** Linux or Android, Android must be selected.
* **Environment device:** where the u-boot environment is stored. SD/MMC must be selected.
* **Extra option:** at the moment, in this submenu it is only possible to force clean before compile.
* **Compiler options:** here the compiler path can be chosen (this is useful for Linux only, leave this as it is), and part of the u-boot version string can be customized.

Once all settings are checked, select Exit, and the following screen select OK to just save the settings or Yes, with Compile to save and directly compile the bootloader.

If you saved the settings, you can also rebuild u-boot with the command:

```bash

HOST$ ./compile.sh

```

This operation usually takes less than a minute (but depends on the host PC). In the end, the bootloader image u-boot.bin is placed in the same directory and is ready to be used to boot the UDOO DUAL/QUAD Board.

###Build Android system image

The easiest but most time-consuming step in building Android is to build the Android system image. In general, after configuring the environment as in configuration section, it is sufficient to launch the following command (from the main folder [udoo-android-dev]) to build the whole system image, including the kernel:

The code:

```bash

HOST$ make

```

The duration of the whole system build is strongly dependent on the host PC you are working on, but this can take up to several hours, and builds more than 20GB of compiled code (this is the size of the [udoo-android-dev]/out/ folder when the operation is completed). Enabling parallel compilation can speed up the process.

In general, the idea is to let the compiler to launch several compiling jobs in parallel, where the number of jobs depends on the specific PC you are working on.

```bash

HOST$ make -jN

```

where N is the maximum number of parallel jobs allowed. For a better explanation of this point (included the value to assign to N), please see http://source.android.com/source/building-running.html, in Build the Code section above.

Several files and folders are created in [OUT]. Among the rest we underline:

* root/ and ramdisk.img: root file system and generated image
* recovery/ and ramdisk-recovery.img: root file system used in recovery mode, and generated image
* system/ and system.img: Android system including binaries and libraries, and generated image
* data/ and userdata.img: Android data area and generated image
* kernel and uImage: kernel images
* boot.img: kernel and initial root ramdisk, generated from kernel and ramdisk.img
* recovery.img: kernel and initial root ramdisk used in recovery mode, generated from kernel and ramdisk-recovery.img

Together with the bootloader image created in the build U-Boot section above, the images are sufficient to boot UDOO DUAL/QUAD board with the default kernel configuration, as described below in the "Use the new Android system images" section. Instead if it is necessary to customize the kernel, the procedure is described in the kernel section below.

###Build Kernel

The kernel is built together with the rest of the Android system. However, it is also possible to modify the configuration and rebuild it separately. As for the bootloader, the kernel can be configured and customized for a very wide range of boards and peripherals. Linux kernel customization is a very complex task, an in-depth description is out of the scope of this document. Here we consider only the default configuration to run linux kernel on UDOO DUAL/QUAD board.

It is possible to configure (or restore) the kernel to the default configuration for the Module calling the command below:

The command:

```bash

HOST$ make -C kernel_imx imx6_udoo_android_defconfig

```

If you wish to check the configuration or customize it, use

```bash

HOST$ make -C kernel_imx menuconfig

```

The command opens a graphical configuration tool equivalent to the one for u-boot. Any saved change is stored in the same folder as an hidden file called .config, which then is the actual configuration file used to compile the kernel.

Once the configuration is ready, the kernel is compiled with command

```bash

HOST$ make bootimage

```

This operation can take up to 30 minutes to complete, and performs several actions:

* builds the kernel, creating the images uImage and zImage in [udoo-android-dev]/kernel_imx/arch/arm/boot
* copies the kernel images in [OUT] (zImage is renamed to kernel)
* updates root/ and ramdisk.img
* updates boot.img from ramdisk.img and kernel

When it is done, the new boot.img is present in [OUT], ready to be used to boot the Module.

###Use the new Android system images

Once the new Android system images are created, it is necessary to prepare a µSD card with the images and boot UDOO DUAL/QUAD board. A script is provided to help with this step. In a way similar to what is described in the Run Android section, the script will partition and format the SD card and then copies the new Android images into the correct partitions, reading them directly from [$OUT] (and [udoo-android-dev]/bootable/bootloader/uboot-imx for the bootloader). It is sufficient to follow the next steps.

Connect the SD card to your host PC, and use the dmesg command to find the device name; we suppose it is /dev/sdc.

Launch the script to prepare the SD

```bash

HOST# croot
HOST# sudo -E ./make_sd.sh /dev/sdc

```

When this is done, the SD card containing the images is ready to boot UDOO DUAL/QUAD as described in the Boot Android from SD section.

##Prepare a Distro

It is sometimes useful to prepare a new Distro to be stored.

To do this, once the new images are built following the procedures described in the previous Sections, it is sufficient to call the command

```bash

HOST$ ./prepare_distro.sh [distro_name]

```

Called without arguments, the script creates a new folder UDOO_Android_4.3_Distro, containing the freshly built Android system images, and the scripts to use them. An archive UDOO_Android_4.3_Distro.tar.gz is also prepared for distribution. The optional parameter [distro_name] can be used to customize the folder and archive name. Once the archive is ready, its use is described in Run Android section.











