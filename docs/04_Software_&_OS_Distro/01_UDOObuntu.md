UDOObuntu is the official Linux-based operating system for the UDOO QUAD/DUAL.

## Technical specifications

UDOObuntu 2 is based on Ubuntu 14.04 LTS. It is provided in two flavours:

 * without any GUI (ideal for headless installations)
 * with a full LXDE desktop environment

Both images can be downloaded from the [image section of the website](https://www.udoo.org/downloads/).

Besides the Ubuntu 14.04 LTS specifications, UDOObuntu differs for the following elements:

 * Linux kernel version 3.14.56
 * GPU accelerated Xorg 1.15
 * Arduino IDE 1.6.5
 * Chromium browser 48, with WebGL enabled
 * gstreamer, which plays full HD videos via gplay
 * QT 5.2.1 with X11 OpenGL ES2 GPU acceleration
 * [Web Control Panel](!Basic_Setup/Web_Control_Panel)
 * [Device Tree Editor](!Cookbook_Linux/Device_Tree_Editor), to control pinmuxing

## Updates

The distribution uses the official Ubuntu repositories and the UDOO repository, so it is possible to update a running system in easy way via:

    sudo apt update
    sudo apt dist-upgrade


## Installation

Instructions to download and flash the SD card image are available on [this page](!Getting_Started/Create_A_Bootable_MicroSD_card_for_UDOO_QUAD-DUAL).


## Default passwords

The default user account is named `udooer`, and its password is `udooer`.

The root password is `ubuntu`.


## Under the hood

The UDOObuntu image available on UDOO website is a full image of an SD card with the following partition scheme:

 * 1MB of reserved storage for the boot-loader (SPL, executable and environment variables)
 * 32MB FAT partition, mounted in `/boot`, which contains kernel, device trees and the documentation
 * an EXT4 partition, mounted in `/`, the *root filesystem*

<img src="../img/partitions.png">

The root partition is automatically expanded at the first boot to the size of the SD card.


## Development

UDOObuntu image is generated automatically from the build script [mkudoobuntu](https://github.com/UDOOboard/mkudoobuntu). This tool builds *recipes* for different boards and image types (eg. with GUI or headless).

The first step is to *debootstrap* a base Ubuntu armhf system. Then some configuration files are patched and UDOO specific packages are installed from the UDOO repository.

### Other old official UDOOBuntu distro.

UDOObuntu 1.0/1.1 was the official UDOO Distribution based on Ubuntu 12.04 LTS armHF with LXDE desktop environment.
Kernel 3.0.35 - U-Boot 2013

Username: ubuntu

Password: ubuntu

Available at [UDOO Downloads Page](https://www.udoo.org/downloads/)
