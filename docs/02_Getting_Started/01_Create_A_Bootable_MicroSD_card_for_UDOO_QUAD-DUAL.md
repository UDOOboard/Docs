## Overview

The following paragraphs will guide you through the creation of a bootable Micro SD card for UDOO QUAD/DUAL, starting from a precompiled image file containing the UDOObuntu 2 or Android Lollipop Operating system, which runs on the i.MX6 processor.

The procedure is quite easy: simply unzip the image and write it on the Micro SD card using the dd tool for UNIX/MAC users or Win32DiskImager for Windows users. It is not possible to create a bootable Micro SD card with drag and drop.

## SD Card Requirements

Please consider that the size of a Micro SD card must be at least 4/8GB (depending on the operating system); Micro SD memory cards with a higher capacity (tested up to 64GB) may be used, and the **Linux** root partition will be expanded to the full SD card size during the first boot. **Android** images are not expanded and stuck at 4GB even if you use a bigger SD card; however you can expand your `/data` partition manually using [UDOO Settings](!Cookbook_Android/UDOO_Android_Settings).

| OS              | Minimum SD size | Maximum SD size | Automatic expansion |
|-----------------|-----------------|-----------------|---------------------|
| UDOObuntu Linux | 4GB             | 64GB            | Yes                 |
| Android         | 8GB             | 64GB            | No                  |


## Step by Step Guide

* Download any official Micro SD image from the [image section of the website](http://www.udoo.org/downloads/).
* Extract the .img file from the .zip file you downloaded into any folder (this path will be referred to as <img_file_path> in the guide).
* Follow the instructions below for the OS you use:

<div>
 <ul id="adc-examples" class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows-example" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#mac-example" aria-controls="mac" role="tab" data-toggle="tab">Mac OS X</a></li>
  <li role="presentation"><a href="#linux-example" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
 </ul>

 <div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="windows-example">

<img style="width:400px; height:218px" src="../img/Box3_Tutorials_UdooSite.png">

Extract the downloaded zip file, so you'll have a .img image file. Do not use the preinstalled archive extractor, use [7-zip](http://www.7-zip.org/) or similar to decompress the zip file.

Download the [Win32DiskImager software](http://sourceforge.net/projects/win32diskimager/) and unzip it.

If your PC has a slot for SD cards (you may need a Micro SD to SD adapter), simply insert the card. If not, insert the card into any SD card reader and then connect it to the PC.

Run the file named Win32DiskImager.exe right-clicking it and selecting “Run as administrator”.

If the Micro SD card (Device) used is not detected automatically, click on the drop down box on the right and select the identifier of the Micro SD card that has been plugged in (e.g. [H:\]). If your Micro SD card is not listed, try to format it using the FAT32 file system.

<span class="label label-warning">Heads up!</span> Please be careful to select the correct drive identifier; if you use the wrong identifier you may lose all data in your PC!

In the Image File box, choose the downloaded .img file and click “Write”. Click *yes* in case a warning message pops up.

The Micro SD card is now ready to be used. Simply insert it in the board’s Micro SD Card slot and boot the system.

If you have problems, have a look to the video tutorial [Creating a bootable MicroSD card using Windows from image](http://www.udoo.org/tutorial/creating-a-bootable-micro-sd-card-using-windows-from-image/).

  </div>
  <div role="tabpanel" class="tab-pane" id="mac-example">

<img style="width:400px; height:218px" src="../img/Box4_Tutorials_UdooSite.png">

From the Terminal app run

    df -h

If your Mac has a slot for SD cards (you may need a Micro SD to SD adapter), simply insert the card. If not, insert the card into any SD card reader and then connect it to the Mac.

Run again

    df -h

The device that wasn't listed before is the Micro SD card just inserted. The name shown will be the one of the filesystem’s partition, for example, `/dev/disk3s1`. Now consider the raw device name for using the entire disk, by omitting the final `s1` and replacing `disk` with `rdisk` (considering the previous example, use `rdisk3`, not `disk3` nor `rdisk3s1`).

<span class="label label-warning">Heads up!</span> Please be careful to select the correct device identifier; if you use the wrong identifier you may lose all data in your Mac!

Unmount all the partitions in the SD card (use the correct name found previously, followed by letters and numbers that identify the partitions). using diskutil:

    sudo diskutil unmount /dev/disk3s1

Now write the image on the Micro SD card using the command:

    sudo dd bs=1m if=<img_file_path> of=/dev/<sd_name>

Please make sure that you replaced the argument of input file (`if=<img_file_path>`) with the path to the .img file, and that the device name specified in output file’s argument (`of=/dev/<sd_name>`) is correct. Please also make sure that the device name is the one of the whole Micro SD card as described above, not just a partition (for example, `rdisk3`, not `disk3s1`). For example:

    sudo dd bs=1m if=/Users/YourName/Download/udoobuntu-udoo-qdl_v2.0.img of=/dev/rdisk3


Once `dd` has been completed, run:

    sudo sync
    sudo diskutil eject /dev/rdisk3


The Micro SD card is now ready to be used. Simply insert it in the board’s Micro SD Card slot and boot the system.

If you have problems, have a look to the video tutorial [Creating a bootable MicroSD card with Mac OSX from image](http://www.udoo.org/tutorial/creating-a-bootable-micro-sd-card-with-mac-os-x-from-image/).

  </div>
  <div role="tabpanel" class="tab-pane" id="linux-example">

<img style="width:400px; height:218px" src="../img/Box2_Tutorials_UdooSite.png">

From the terminal run

    df -h

If your PC has a slot for SD cards (you may need a Micro SD to SD adapter), simply insert the card. If not, insert the card into any SD card reader and then connect it to the PC.

Run again

    df -h

The device that wasn't listed before is the Micro SD card just inserted. The left column will show the device name assigned to the Micro SD card. It will have a name similar to `/dev/mmcblk0p1` or `/dev/sdd1`. The last part of the name (`p1` or `1`, respectively) is the partition number, but it is necessary to write on the whole Micro SD card, not only on one partition. Therefore, it is necessary to remove that part from the name (for example `/dev/mmcblk0` or `/dev/sdd`) in order to work with the whole Micro SD card.

<span class="label label-warning">Heads up!</span> Please be careful to select the correct device identifier; if you use the wrong identifier you may lose all data in your PC!

Unmount all the partitions in the SD card (use the correct name found previously, followed by letters and numbers that identify the partitions). using umount:

    sudo umount /dev/sdd1

Now write the image on the Micro SD card using the command:

    sudo dd bs=1M if=<img_file_path> of=/dev/<sd_name>

Please make sure that you replaced the argument of input file (`if=<img_file_path>`) with the path to the .img file, and that the device name specified in output file’s argument (`of=/dev/<sd_name>`) is correct. For example:

    sudo dd bs=1m if=/home/YourName/Download/udoobuntu-udoo-qdl_v2.0.img of=/dev/sdd


Once `dd` has been completed, run:

    sudo sync


The Micro SD card is now ready to be used. Simply insert it in the board’s Micro SD Card slot and boot the system.

If you have problems, have a look to the video tutorial [Creating a bootable MicroSD card with Linux Ubuntu from image](http://www.udoo.org/tutorial/creating-a-bootable-micro-sd-card-with-linux-ubuntu-from-image/).

  </div>
 </div>
</div>
<script>
$('#adc-examples a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
</script>
