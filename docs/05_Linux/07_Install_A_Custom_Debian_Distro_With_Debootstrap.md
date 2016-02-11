**Prerequisites**

* A SD card for the resulting system (1GB or larger)
* Official UDOO DUAL/QUAD Kernel and Modules for your model http://www.udoo.org/downloads/
* U-boot for your model http://www.udoo.org/downloads/
* Debian or Linux OS for creating the install

**Required software**

**(Available through apt-get)**

* binfmt-support
* qemu-user-static
* debootstrap

I'm going to use /dev/sdb to represent the SD card and ~/deb as the directory I'm building Debian in.

You can also use a SATA disk instead of an SD card, if using a SATA disk, it is even possible to build the system entirely on the UDOO DUAL/QUAD.

Also, with SATA be sure to [setup U-Boot](/docs/Advanced_Setup/UDOO_Boot_From_SATA#prepareuboot)

Substitute these with your own paths as needed.

First, you need to partition the SD card. Leave room before the primary partition to place uboot. Uboot needs to start at offset 1024B.

Here is an example SD card layout, as displayed by fdisk:

```bash

 Device Boot       Start         End      Blocks   Id  System
   /dev/sdb1    16065    13414274     6699105   83  Linux

```

(units: 512B sectors)

You can format and mount the Linux partition with:

```bash

# mkfs.ext3 /dev/sdb1
# mount /dev/sdb1 /mnt

```

You could also mount your device to ~/dev is you want to build directly on a SD card or SATA disk.

Flash U-Boot by running the following command: (This is required to be on the SD even if using SATA)

```bash

(Replace u-boot-q.bin with the name of the U-Boot file you downloaded)

dd if=u-boot-q.bin of=/dev/sdb bs=512 seek=2 skip=2

NOTE: We are using /dev/sdb here, NOT sdb1, Also, be sure sdb is the sd card

```

## Bootstrapping Debian

### First Stage

First, lets create our working directory

```bash

# mkdir ~/deb

```

Then we can run the first stage of installing Debian

```bash

# debootstrap --foreign --arch=armhf wheezy ~/deb

NOTE: For soft-float use --arch=armel instead

```

Once that completes we are almost ready for the second stage, but before we do that, we must copy qemu's arm binary to the new distro. This will allow us to chroot into the new system.

```bash

# cp /usr/bin/qemu-arm-static ~/deb/usr/bin/

```

### Second Stage

Now, we install the second stage

```bash

# chroot ~/deb /debootstrap/debootstrap --second-stage

```

This will chroot into the new system and complete the install. You can optionally remove qemu-arm-static from the new install at this point.

Now its time to install the kernel

```bash

# cp path/to/uImage ~/dev/boot
# cd ~/deb
# tar xzf path/to/modules.tar.gz

```

Note: replace path/to with the path where you placed the kernel and modules. If using SATA, be sure to place uImage on the SD card also. Otherwise you will not be able to boot.

## Post install changes

We now have a working Debian system that will boot, however, we will not have networking.

chroot into the system:

```bash

# chroot ~/deb

```

edit etc/network/interfaces to add the eth0 interface

```bash

# nano /etc/network/interfaces
 
auto eth0
iface eth0 inet dhcp

```

also, edit the bottom of /etc/inittab if you want a serial terminal

```bash

T1:23:respawn:/sbin/getty -L ttymxc1 115200 vt100

```

You may also apt-get any additional packages, once on an SD card, write performance is usually slower.

Packages you may want

```bash

openssh-server for SSH

firmware-ralink  for the wifi

wpasupplicant for wifi connections

lxde or xfce for a desktop enviroment

tightvncserver for remote desktop

git because who DOESN'T download from git?

bluetooth for bluetooth support

```

Once done, exit the chroot.

## Transfer to SD card

If you chose to build the system directly on SD or SATA you can skip this step. Now we can copy the new system to your sd card or SATA disk.

```bash

# cd ~/deb/
# cp -rp * /mnt/

```

Once complete its now time to boot!

## Boot!

Now the system is ready for booting! You should already have all the drivers you need for the hardware, some like bluetooth, may require additional software.


This guide has been adapted from the guide over at the [Freescale community](https://community.freescale.com/docs/DOC-95044).

## Binary Tarball

Binary tarballs are available below:

debian_wheezy_armhf_base system http://down.ags131.us/udoo_debian_wheezy.tgz

debian_wheezy_armel_lxde system http://down.ags131.us/debian_wheezy_armel_lxde.tgz

just download it and

```bash

 tar xzf udoo_debian_wheezy.tgz 

```

inside your sdcard, SATA disk or staging directory rather than going through debootstrap

user is root password is debian

LXDE Downloads have vnc autostarted <IPADDRESS>:1 pass is debian



















