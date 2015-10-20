## Overview

The following paragraphs will guide to in the creation of a bootable micro SD card for UDOO board, starting from a precompiled image file containing the UDOO Operating system, which runs using the i.MX6 processor. Without the O.S., it is possible only to use UDOO like a normal Arduino Due (only SAM3X8E processor). The procedure is quite easy: simply unzip the image and write it on the SD card using the dd tool for UNIX/MAC users or Win32DiskImager for Windows users. It is not possible to create a bootable SD card with drag and drop. Please consider that the micro SD card size must be at least 8GB; higher capacity SD memory cards (tested up to 64GB) may be used but only 8GB will be available at the end of the procedure.



## Step by Step Guide

* Download any official SD images from the image section of the website http://www.udoo.org/downloads/.
* Extract the .img file from the .zip file you downloaded into any folder (this path will be referred to as <img_file_path> in the guide).
* Follow the instructions below for the OS you use:


###Write the image on micro SD card Using Linux

<img style="width:400px; height:218px" src="/docs/img/Box2_Tutorials_UdooSite.png">

From the terminal run:

```bash

df -h

```


If the computer used has a slot for SD cards (SD to micro SD adapter needed), insert the card. If not, insert the card into any SD card reader and then connect it to the computer. Note: the microSD card must be formatted using FAT32 File System!

Run again:


```bash

df -h

```

The device that had not been listed before is the micro SD card just inserted. The left column will show the device name assigned to the micro SD card. It will have a name similar to “/dev/mmcblk0p1″ or “/dev/sdd1″. The last part of the name (“p1″ or “1″, respectively) is the partition number, but it is necessary to write on the whole micro SD card, not only on one partition. Therefore, it is necessary to remove that part from the name (for example “/dev/mmcblk0″ or “/dev/sdd”) in order to work with the whole micro SD card.

If the micro SD card contains more than one partition, it is necessary to unmount all of these partitions (using the correct name found previously, followed by the letters and numbers identifying the partitions) using the command:

e.g. 

```bash

sudo umount /dev/sdd1


```


Now, write the image on the micro SD card with the command:


```bash

sudo dd bs=1M if=<img_file_path> of=/dev/<sd_name>

```

Please be sure that you replaced the argument of input file (if=<img_file_path>) with the path of the .img file, and that the device name specified in output file’s argument (of=/dev/<sd_name>) is correct. This is very important, since you could lose all data on the hard drive of the Host PC if it is used the wrong device name. Please also be sure that the device name is that of the whole micro SD card, as described above, not just a partition. (e.g. sdd, not sdds1 or sddp1, or mmcblk0 not mmcblk0p1)

e.g. 

```bash

sudo dd bs=1M if=/home/<user_name>/Download/2013-5-28-udoo-ubuntu.img of=/dev/sdd

```

Once dd has been completed, run the sync command as root or run sudo sync as a normal user (this will ensure that the write cache is flushed and that it is safe to unmount the micro SD card).

Then run:

```bash

  sudo umount /media/<sd_label>

```

The micro SD card is now ready to be used. Simply, insert it in UDOO’s microSD Card slot and boot the system.

Here you can find the video tutorial of [Creating a bootable MicroSD card with Linux Ubuntu from image](/tutorial/creating-bootable-micro-sd-card-linux-ubuntu-image/).

###Write the image on micro SD card using Mac OSX

<img style="width:400px; height:218px" src="/docs/img/Box4_Tutorials_UdooSite.png">

Note: May not work with OSX 10.9 Mavericks

From the terminal run


```bash

df -h


```


If the Mac has a slot for SD cards (SD to micro SD adapter needed), insert the card. If not, insert the card into any SD card reader and then connect it to the Mac. Note: the microSD card must be formatted using FAT32 File System!

Run again


```bash

df -h


```

The device that wasn't listed before is the microSD card just inserted. The name shown will be the one of the filesystem’s partition, for example, /dev/disk3s1. Now consider the raw device name for using the entire disk, by omitting the final “s1″ and replacing “disk” with “rdisk” (considering the previous example, use rdisk3, not disk3 nor rdisk3s1). This is very important, since it could result in the loss of all data of the disk of the Mac used, when referring to the wrong device name. Since there could be other SD with different drive names/numbers, like rdisk2 or rdisk4, etc. check again the correct name of the microSD card by using the df -h command both before & after the insertion of the microSD card into the Mac used.

e.g. 

```bash

/dev/disk3s1 => /dev/rdisk3


```

If the microSD card contains more partitions, unmount all of these partitions (use the correct name found previously, followed by letters and numbers that identify the partitions).

The code:

```bash

sudo diskutil unmount /dev/disk3s1


```

Now write the image on the microSD card using the command:

```bash

sudo dd bs=1m if=path_del_file_img of=/dev/<sd_name>


```

Please be sure that you replaced the argument of input file (if=<img_file_path>) with the path to the .img file, and that the device name specified in output file’s argument (of=/dev/<sd_name>) is correct. This is very important since it could result in the loss of all the data your Mac, when referring to the wrong device name). Please also be sure that the device name is the one of the whole microSD card as described above, not just a partition (for example, rdisk3, not disk3s1).

e.g. 

```bash

sudo dd bs=1m if=/home/user_name/Download/2013-5-28-udoo-ubuntu.img of=/dev/rdisk3


```

Once dd has been completed, run the sync command as root or run sudo sync as a normal user (this will ensure that the write cache is flushed and that it is safe to unmount the micro SD card).

Then run:

```bash

sudo diskutil eject /dev/rdisk3


```

The micro SD card is now ready to be used. Simply, insert it in UDOO’s microSD Card slot and boot the system.

Here you can find the video tutorial of [Creating a bootable MicroSD card using Windows from image](/tutorial/creating-bootable-micro-sd-card-using-windows-image/).


###Write the image on micro SD card Using Windows

<img style="width:400px; height:218px" src="/docs/img/Box3_Tutorials_UdooSite.png">

Download the Win32DiskImager software [here](http://sourceforge.net/projects/win32diskimager/) and unzip it.

If the PC used has a slot for SD cards (SD to microSD adapter needed), simply insert the card. If not, insert the card into any SD card reader and then connect it to the PC. Note: the microSD card must be formatted using FAT32 File System!

Run the file named Win32DiskImager.exe (with Windows Vista, 7 and 8 right-click the file and select “Run as administrator”).

If the micro SD card (Device) used is not detected automatically, click on the drop down box on the right and select the identifier of the micro SD card that has been plugged in (e.g. [H:\]). Note: the microSD card must be formatted using FAT32 File System!

Please be careful to select the correct drive identifier; if you use the wrong identifier, you can lose all data on the PC's hard disk!

In the Image File box, choose the downloaded .img file and click “Write”. Note: click YES in case it pops up a warning message.

The microSD card is now ready to be used. Simply insert it in UDOO’s microSD Card slot and boot the system.

Here you can find the video tutorial of [Creating a bootable MicroSD card with Mac OSX Ubuntu from image](/tutorial/creating-bootable-micro-sd-card-mac-os-x-image/).


