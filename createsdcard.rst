################################
Create a bootable MicroSD Card 
################################


===============
Windows
===============


..  youtube:: vMAZZzTQsS4
        :width: 100%
        

* Download `Win32DiskImager <_utils/Win32DiskImager-0.9.5-install.exe>`_ Utility, Install and launch it
* Insert a MicroSD Card (at least 8gb) into SD Card Slot or external reader
* If the micro SD card (Device) used is not detected automatically, click on the drop down box on the right and select the identifier of the micro SD card that has been plugged in (e.g. [H:\])
  **WARNING: Make sure you're using the correct driver identifier! Mistakes here could lead to data loss!**
* In the Image File box, choose the downloaded *.img* file and click *Write*
  Note: click YES in case it pops up a warning message.
* The microSD card is now ready to be used. Simply insert it in UDOO’s microSD Card slot and boot the system.


.. image:: _static/images/msdwin.png

======
LINUX
======

..  youtube:: 044ijVTUaqs
        :width: 100%
        

* From the terminal run::

   df -h

If the computer used has a slot for SD cards (SD to micro SD adapter needed), insert the card. If not, insert the card 
into any SD card reader and then connect it to the computer

* Run again::

   df -h

The device that had not been listed before is the micro SD card just inserted. The left column will show the device name
assigned to the micro SD card. It will have a name similar to “/dev/mmcblk0p1″ or “/dev/sdd1″. The last part of the name
(“p1″ or “1″, respectively) is the partition number, but it is necessary to write on the whole micro SD card, not only 
on one partition. Therefore, it is necessary to remove that part from the name (for example “/dev/mmcblk0″ or “/dev/sdd”)
in order to work with the whole micro SD card.
If the micro SD card contains more than one partition, it is necessary to unmount all of these partitions (using the 
correct name found previously, followed by the letters and numbers identifying the partitions) using the command::

   sudo umount /dev/sdd1
   
* Now, write the image on the micro SD card with the command::

  sudo dd bs=1M if=img_file_path of=/dev/sd_name
  
**WARNING!Please be sure that you replaced the argument of input file (if=<img_file_path>) with the pathof the .img file, and that
the device name specified in output file’s argument (of=/dev/<sd_name>) is correct. An incorrect device name could lead to
data loss!**::

   sudo dd bs=1M if=/home/<user_name>/Download/2013-5-28-udoo-ubuntu.img of=/dev/sdd
   
* Once dd completes, run the sync command as root or run sudo sync as a normal user (this will ensure that the write cache 
is flushed and that it is safe to unmount the micro SD card). Then run::
   
   sudo umount /media/<sd_label>
   
* The micro SD card is now ready to be used. Simply, insert it in UDOO’s microSD Card slot and boot the system.


========
MAC OS X
========

..  youtube:: A4iRKyJHtT4
        :width: 100%
        
        

Note: May not work with OSX 10.9 Mavericks

From the terminal run::
   
   df -h
   
If the Mac has a slot for SD cards (SD to micro SD adapter needed), insert the card. If not, insert the card into any SD 
card reader and then connect it to the Mac.
Note: the microSD card must be formatted usingFAT32 File System!

Run again::
  
   df -h
   
The device that had not been listed before is the microSD card just inserted. The name shown will be that of the 
filesystem’s partition, for example, /dev/disk3s1. Now consider the raw device name for using the entire disk, by 
omitting the final “s1″ and replacing “disk” with “rdisk” (considering previous example, use rdisk3, not disk3 nor 
rdisk3s1). This is very important, since it could result in the loss of all data of the disk of the Mac used, when 
referring to the wrong device name. Since there could be other SD with different drive names/numbers, like rdisk2 or 
rdisk4, etc. check again the correct name of the microSD card by using the df -h command both before & after the
insertion of the microSD card into the Mac used.::

   /dev/disk3s1 => /dev/rdisk3
   
If the microSD card contains more partitions, unmount all of these partitions (use the correct name found previously, 
followed by letters and numbers that identify the partitions) with the command::
   
   sudo diskutil unmount /dev/disk3s1
   
Now write the image on the microSD card using the command::

   sudo dd bs=1m if=path_del_file_img of=/dev/<sd_name>
   
Please be sure that you replaced the argument of input file (if=<img_file_path>) with the path to the .img file, and 
that the device name specified in output file’s argument (of=/dev/<sd_name>) is correct. This is very important, since
it could result in the loss of all data of the disk of the Mac used, when referring to the wrong device name.). Please
also be sure that the device name is that of the whole micro SD card as described above, not just a partition 
(for example, rdisk3, not disk3s1).::

   sudo dd bs=1m if=/home/user_name/Download/2013-5-28-udoo-ubuntu.img of=/dev/rdisk3
   
Once dd completes, run the sync command as root or run sudo sync as a normal user (this will ensure that the write cache 
is flushed and that it is safe to unmount the micro SD card). Then run::

   sudo diskutil eject /dev/rdisk3
   
The micro SD card is now ready to be used. Simply, insert it in UDOO’s microSD Card slot and boot the system.


============================
Create a MicroSD Card from Binaries
============================


The following paragraphs will guide to in the creation of a bootable micro SD card for UDOO board, starting from 
precompiled binaries. This method offers more flexibility and customization opportunities for the average users.
If you don’t feel confident about using binaries you should use the image file method to create your Micro SD card.
Note: The following step by step guide is referred to a Linux System.




A bootable SD card has 4 different elements:
 - U-Boot (it's a .imx file)
 - Kernel (it's an uImage file)
 - Kernel's modules (it's a compressed file, e.g. .tar.gz)
 - File System (it's a compressed file, e.g. .tar.gz)
 
Create a new folder "udoo-dev" under your Home directory, then browse the UDOO's web site to the Download page and
download the binaries you need.


**Partition the MicroSD card**

Insert the Micro SD card in the card reader and launch GParted from command line::

   sudo gparted 
   
Select the Micro SD from the drop down menu, e.g. /dev/sdc. 

NOTE: Be sure you’ re using the correct label; using of the wrong device identifier could result in the loss of 
all data on the Hard Drive of the host PC used.

Create a partition table from the top menu: Device → Create Partition Table... → Apply.

Create a new partition with the following parameters
 - Free space preceding (MiB): 10
 - New size (MiB): based to the SD size
 - Free space following (MiB): 10
 - Create as: Primary partition
 - File system: ext3 (ext4 is not supported yet)
 - Label: <UDOO_MICROSD_LABEL>

Click on Apply and wait for the partition to be done, then exit GParted.



**Copy the files to the Micro SD card**

File System
Mount the just-created partition and then extract the tar.gz file containing the filesystem inside the microSD card 
with the following command (this operation could take up to 30 minutes)::

   sudo tar -xzvpf <NAME_OF_TAR_FS> -C /media/<UDOO_MICROSD_LABEL>/
   
   
*Note: Always remember to replace the strings inside the brackets with the right filenames.*


**Kernel Image**

Copy the binary inside the Micro SD card /boot folder by using the following command::

   sudo cp uImage /media/<UDOO_MICROSD_LABEL>/boot 
   
   
**Kernel's modules**


Remove the existing modules from the file system::

   sudo rm -rv /media/<UDOO_MICROSD_LABEL>/lib/modules/* 
   
Copy the new modules::

   sudo cp -av lib /media/<UDOO_MICROSD_LABEL>/ 
   
**Install the U-Boot**


Unmount all the microSD partitions::


   sudo umount /dev/<MICROSD_DEVICE_NAME>*
   


Copy the u-boot binary file inside the Micro SD. 


For UDOO Quad::
   sudo dd if=u-boot-q.imx of=/dev/<MICROSD_DEVICE_NAME> bs=512 seek=2
   
   
For UDOO Dual::
   sudo dd if=u-boot-d.imx of=/dev/<MICROSD_DEVICE_NAME> bs=512 seek=2
   
   

*NOTE: Be sure you’ re using the correct device filename; use of the wrong device identifier could result in the loss
of all data on the Hard Drive of the host PC used. Before remove the Micro SD card run the command to write any data
buffered in memory out to disk*::


   sync 
   
   
**The microSD card is now ready.**


