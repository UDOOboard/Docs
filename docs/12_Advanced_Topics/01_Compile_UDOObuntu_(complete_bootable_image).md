## Overview

Note: The following instructions are referred to a Linux system.

A bootable SD card has 3 different elements:

* U-Boot (Universal Bootloader)
* Linux Kernel
* File System (e.g: UDOObuntu)

To create a complete UDOObuntu OS image with these three elements compiled from source you can use the [`mkudoobuntu`](https://github.com/UDOOboard/mkudoobuntu) script.
This could be a useful starter point to create also other distros.

## mkudoobuntu

mkudoobuntu creates SD-card images for UDOO QUAD-DUAL. It supports both desktop and headless images. The created images are as small as possible and expanded to the whole card size during the first boot.
This script use Debootstrap to compile Ubuntu 14.04 LTS file system and the others UDOO github repos to compile the UDOO's Linux Kernel and U-Boot.  

This script has been tested on Ubuntu 15.10, 15.04 and 14.04. It may work on other Debian-like system.

Download the latest mkudoobuntu revision from GitHub:

```bash

git clone https://github.com/UDOOboard/mkudoobuntu.git
cd mkudoobuntu

```

To debootstrap a new image with a desktop environment(LXDE) use:

```bash

sudo ./mkudoobuntu.sh udoo-qdl desktop

```

To have a new image minimal without any GUI use:

```bash

sudo ./mkudoobuntu.sh udoo-qdl minimal

```

You can find more info and commands about this script directly on the [Github repo](https://github.com/UDOOboard/mkudoobuntu).

Once the script finished you can find the .img file in the main mkudoobuntu folder.
You can create a bootable microSD from the .img file following this guide: [creating a bootable Micro SD card from precompiled image](../Getting_Started/Create_A_Bootable_MicroSD_card_for_UDOO_QUAD-DUAL.html).
 
