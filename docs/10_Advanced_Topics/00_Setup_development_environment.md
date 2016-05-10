The recommended OS for developing UDOO is Ubuntu. If you do not use Ubuntu, you will need to install a virtual machine, as indicated in this section.

If you are already running Ubuntu on your development computer, you can safely skip this section.

## Overview
In this section we provide a guide to setup a clean and dedicated environment for UDOO Development as:
* compile kernel
* compile MQX libraries

## Download resources

### Virtual Machine Player

[VMWare Download Section](https://my.vmware.com/web/vmware/downloads)

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_dwl_01.PNG">

[VMware Workstation Player](https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0)

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_dwl_02.PNG">

<img style="width:300px;" src="../img/gionji/DOCS_dev_env_dwl_03.PNG">


### Operating System

[Ubuntu Desktop Download Page](http://www.ubuntu.com/download/desktop)

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_dwl_04.PNG">



## Installation
### VMware

### Ubuntu 14.04 32 bit
Open VMware Player and choose "Create a New Virtual Machine"
<img style="width:500px;" src="../img/gionji/DOCS_dev_env_01.PNG">

Select "installer disc image (iso)" option and Browse the Ubuntu 14.04 32 image. Click Next.

<img style="width:400px;" src="../img/gionji/DOCS_dev_env_02.PNG">

Choose the user full name, username and password.

<img style="width:400px;" src="../img/gionji/DOCS_dev_env_03.PNG">

Choose the Virtual machine name and its location. It's recommended to put it into a drive with 30GB free at least.

<img style="width:400px;" src="../img/gionji/DOCS_dev_env_04.PNG">

Choose the maximum virtual hard disk size (20 GB is ok) but 30 is recommended. Space is allocated when is needed.

<img style="width:400px;" src="../img/gionji/DOCS_dev_env_05.PNG">

Customize hardware.

<img style="width:400px;" src="../img/gionji/DOCS_dev_env_06.PNG">

Depending on your host computer choose the amount of ram memory. 1GB should be ok, but 2 is better :)

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_07.PNG">

You can also choose the number of dedicated cores. Don't use all the cores for the virtual machine or you host will become unstable. Select OK and then Next.

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_08.PNG">

Installation process will start.

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_09.PNG">

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_10.PNG">

Insert your password.

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_11.PNG">

Now you should access to a Ubuntu 14.04 desktop.

<img style="width:800px;" src="../img/gionji/DOCS_dev_env_12.PNG">


## Launch the Virtual Machine

### Install VMware tools
If the system ask for install VMware tools we suggest to accept. It provides useful tools like, window resize and direct copy feature.

### Update the system
Open a terminal.

<img style="width:100px;" src="../img/gionji/DOCS_dev_env_13.PNG">
<img style="width:150px;" src="../img/gionji/DOCS_dev_env_14.PNG">
<img style="width:800px;" src="../img/gionji/DOCS_dev_env_15.PNG">

    sudo apt-get update
