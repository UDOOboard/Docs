With the official <a href="https://www.udoo.org/downloads/" title="Download section"><strong>UDOObuntu</strong></a> distro using your LVDS is very easy!! Follow these simple steps:

Open the <strong>"UDOO DUAL/QUAD configuration tool"</strong> you can find in desktop or in the applications top bar.
Select <em>"Set Default Video Output (LVDS\HDMI)"</em>.
Select the output video you need.
Reboot the system.

That's it!!!
</br>
To use your LVDS with other UDOO DUAL/QUAD distros you need to follow these instructions:

Make sure you have the lastest U-Boot and kernel. If not you can use the simple <a href="/docs/Advanced_Setup/UDOO_Kernel_Update_Procedure" title="udooupdate" target="_blank">update procedure</a>.

With the last U-Boot version (release 2.1 - v.119) you need to change the "video" environment variables with:

15" --&gt; video=mxcfb0:dev=ldb,1366x768M@60,if=RGB24,bpp=32

7" --&gt; video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32

hdmi --&gt; video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24,bpp=32 (default environment variable)

To do this you need to connect an external pc to the debug serial of UDOO DUAL/QUAD and stop the boot procedure at U-Boot. For more info see the Tutorial <a href="/docs/Connecting%20UDOO/Connecting_Via_Serial_Cable" title="Connecting via serial cable">connecting via serial cable</a> or the <a title="UDOO Manual" href="https://www.udoo.org/download/files/Documents/UDOO_Starting_Manual_beta0.4_11_28_2013.pdf" target="_blank">UDOO DUAL/QUAD starting manual</a> at the “Establish serial debug connection with UDOO DUAL/QUAD” section.

These are the commands you need to insert in the U-Boot console:
&nbsp;



<strong>15" linux:</strong>

```bash

setenv mmcargs setenv bootargs console=${console},${baudrate} root=${mmcroot} ${hdmi_patch} fbmem=24M video=mxcfb0:dev=ldb,LDB-WXGA,if=RGB24,bpp=32

```

<strong>15" android:</strong>

```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=ldb,1366x768M@60,if=RGB24,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale mem=1024M

```


<strong>7" linux:</strong>

```bash

setenv mmcargs setenv bootargs console=${console},${baudrate} root=${mmcroot} ${hdmi_patch} fbmem=24M video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32

```


<strong>7" android:</strong>


```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale mem=1024M

```

<strong>hdmi linux:</strong>

```bash

setenv mmcargs setenv bootargs console=${console},${baudrate} root=${mmcroot} ${hdmi_patch} fbmem=24M video=mxcfb0:dev=hdmi,1920x1080M@60,bpp=32

```


<strong>hdmi android:</strong>

```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale mem=1024M

```


At the next boot the video source will again be the default one unless you save the configuration you just inserted with the command:


```bash

saveenv

```

In Android you can also boot UDOO DUAL/QUAD from both HDMI and LVDS panel at the same time inserting these variables in a different frame buffer:

e.g. boot on lvds 7" and hdmi.

```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32 video=mxcfb1:dev=hdmi,1920x1080M@60,if=RGB24,bpp=32 video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale mem=1024M

```

If you have any problem with touch <strong>calibration</strong> in Linux distros try to modify the text file:

/etc/X11/xorg.conf.d/99-calibration.conf

with this text:

```bash

Section "InputClass"
Identifier      "calibration"
MatchProduct    "3M 3M USB Touchscreen - EX II"
Option  "Calibration"   "-75 65106 2318 65008"
Option  "SwapAxes"      "0"
Option  "InvertX"      "1"
Option  "InvertY"      "0"
EndSection

Section "InputClass"
Identifier      "calibration"
MatchProduct    "sitronix-i2c-touch-mt"
Option  "Calibration"   "10 802 11 479"
EndSection

```

If the calibration is not good enough you can connect a mouse to UDOO DUAL/QUAD and launch the "Calibrate Touchscreen" application from the top bar:

Application -> System Tools -> Administration -> Calibrate Touchscreen

or run in a terminal the command:

```bash

xinput_calibrator

```

and follow the video instruction to change your calibration.