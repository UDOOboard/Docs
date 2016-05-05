Updating UDOO DUAL/QUAD's kernel ensures you're aligned with latest Official build of UDOO DUAL/QUAD Kernel Unico. This kernel is developed to suit a general purpose system, so it is the suggested kernel for UDOO DUAL/QUAD Board.

## On UDOO DUAL/QUAD Board with internet connection

If you have access to a wifi or an ethernet connection download the update package directly on UDOO DUAL/QUAD running UDOOUbuntu. Turn on your UDOO DUAL/QUAD following the [Started Guide](/docs/Getting_Started/Very_First_Start)

Once the OS has booted open a terminal and type the command:

```bash

wget http://download.udoo.org/files/udooupdate.tar.gz

```

## On UDOO DUAL/QUAD board without internet connection

If you don’t have any internet connection on UDOO DUAL/QUAD, you can download the package on your computer from the UDOO website:

```bash

http://download.udoo.org/files/udooupdate.tar.gz

```

Copy the package on a USB pen drive. When Ubuntu OS on UDOO DUAL/QUAD is ready insert the usb pen and copy the update file in the home folder.

## Update Procedure

Open the terminal and extract the package using the command:

```bash

tar -xzvf udooupdate.tar.gz

```

Navigate into the folder you just created:

```bash

cd udooupdate

```

run the script as administrator replacing –cpu option value with the cpu type of your board [dual,quad] e.g.:

FOR QUAD

```bash

sudo ./udooupdate.sh --cpu=quad

```

FOR DUAL

```bash

sudo ./udooupdate.sh --cpu=dual

```

This script basically copy the new U-boot image and Kernel image on SD. Once the update has finished reboot the UDOO DUAL/QUAD board using the command:

```bash

sudo reboot

```

Done.












