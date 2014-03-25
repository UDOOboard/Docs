################################
Create a bootable MicroSD Card from Image
################################


The following paragraphs will guide to in the creation of a bootable micro SD card for UDOO board, starting from 
a precompiled image file containing the UDOO Operating system, which runs using the i.MX6 processor. Without the O.S., 
it is possible only to use UDOO like a normal Arduino Due (only SAM3X8E processor). The procedure is quite easy: 
simply unzip the image and write it on the SD card using the dd tool for UNIX/MAC users or Win32DiskImager for Windows 
users. It is not possible to create a bootable SD card with drag and drop. Please consider that the micro SD card size 
must be at least 8GB; higher capacity SD memory cards may be used but only 8GB will be available at the end of the
procedure.




Download any SD images from the image section of the website http://www.udoo.org/downloads/
Extract the .img file from the .zip file you downloaded into any folder (this path will be referred to as 
<img_file_path> in the guide).





Follow the instructions below for the OS you use:


