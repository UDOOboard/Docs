## Overview

The following paragraphs will guide to in the creation of a bootable micro SD card for UDOO DUAL/QUAD board, starting from precompiled binaries. This method offers more flexibility and customization opportunities for the average users.

If you don’t feel confident about using binaries you should use the image file method to create your Micro SD card.

Note: The following step by step guide is referred to a Linux System.


## Step by Step Guide

### Download the binaries

A bootable SD card has 4 different elements:

* U-Boot (.imx file, should be u-boot-<q|d>.imx)
* Kernel (Should be uImage)
* kernel's modules (Usually a compressed file, e.g. .tar.gz)
* File System (Usually a compressed file, e.g. .tar.gz)

Create a new folder "udoo-dev" under your Home directory, then browse the UDOO's web site to the Download page and download the binaries you need.

### GParted the Micro SD card

Insert the Micro SD card in the card reader and launch GParted from command line:


```bash

sudo gparted

```

Select the Micro SD from the drop down menu, e.g. /dev/sdc. 

NOTE: Be sure you’ re using the correct label; using of the wrong device identifier could result in the loss of all data on the Hard Drive of the host PC used.

Create a partition table from the top menu: Device → Create Partition Table... → Apply.

Create a new partition with the following parameters:

* Free space preceding (MiB): 10
* New size (MiB): based to the SD size
* Free space following (MiB): 10
* Create as: Primary partition
* File system: ext3 (ext4 is not supported yet)
* Label: <UDOO_MICROSD_LABEL>

Click on Apply and wait for the partition to be done, then exit GParted.


### Copy the files to the Micro SD card

**File System**

Mount the just-created partition and then extract the tar.gz file containing the filesystem inside the microSD card (this operation could take up to 30 minutes)

The code:

```bash

sudo tar -xzvpf <NAME_OF_TAR_FS> -C /media/<UDOO_MICROSD_LABEL>/

```

Note: Always remember to replace the strings inside the brackets with the right filenames.

**Kernel Image**

Copy the binary inside the Micro SD card /boot folder by using the following command:

```bash

sudo cp uImage /media/<UDOO_MICROSD_LABEL>/boot 

```

**Kernel's modules**

Remove the existing modules from the file system:

```bash

sudo rm -rv /media/<UDOO_MICROSD_LABEL>/lib/modules/* 

```

Copy the new modules:

```bash

sudo cp -av lib /media/<UDOO_MICROSD_LABEL>/ 

```

**Install the U-Boot**

Unmount all the microSD partitions:

```bash

sudo umount /dev/<MICROSD_DEVICE_NAME>*

```

e.g. <MICROSD_DEVICE_NAME>* is /dev/sdc* 

Copy the u-boot binary file inside the Micro SD. 

For UDOO QUAD:

```bash

sudo dd if=u-boot-q.imx of=/dev/<MICROSD_DEVICE_NAME> bs=512 seek=2
   
```

For UDOO DUAL:

```bash

sudo dd if=u-boot-d.imx of=/dev/<MICROSD_DEVICE_NAME> bs=512 seek=2
   
```
   
e.g. <MICROSD_DEVICE_NAME> is /dev/sdc 

NOTE: Be sure you’ re using the correct device filename; use of the wrong device identifier could result in the loss of all data on the Hard Drive of the host PC used.

Before remove the Micro SD card run the command to write any data buffered in memory out to disk:

```bash

sync 
   
```
   
The microSD card is now ready.




