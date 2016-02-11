**Attention:** Before starting make sure you have the lastest u-boot and kernel. If not you can use the simple update procedure

##Using LVDS Panels with UDOOBuntu official OS

The simplest way to use LVDS panels with UDOO DUAL/QUAD is using the UDOO DUAL/QUAD Configuration Tool+

* Open UDOO DUAL/QUAD Configuration Tool
* Select Set Default Video Output (LVDS\HDMI) and hit OK
* Select your LVDS Model ( 7 or 15") and hit OK
* A dialog should inform you that video boot arguments have been changed correctly
* In some cases you could be required to choose a resolution. Choose it accordingly to your device.
* Reboot for changes to take effect

##Manual Video Output Configuration

To use your LVDS with UDOO DUAL/QUAD you have to follow these simple instructions.

First connect an external pc to the debug serial of UDOO DUAL/QUAD. Once done connect the serial USB Cable to UDOO DUAL/QUAD and turn it on by plugging the Power Supply.

From your computer, hit a key before normal boot starts up and type the right parameters for your Operating system and LVDS panel.

The default Variable, which outputs to HDMI is:

```bash

video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24,bpp=32

```

##Exact UBOOT Parameters

###15" Linux

```bash

setenv mmcargs setenv bootargs console=${console},${baudrate} root=${mmcroot} ${hdmi_patch} fbmem=24M video=mxcfb0:dev=ldb,LDB-WXGA,if=RGB24,bpp=32

```

###15" Android

```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=ldb,1366x768M@60,if=RGB24,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale mem=1024M

```


###7" Linux

```bash

setenv mmcargs setenv bootargs console=${console},${baudrate} root=${mmcroot} ${hdmi_patch} fbmem=24M video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32

```

###7" Android

```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale mem=1024M

```

###HDMI Linux

```bash

setenv mmcargs setenv bootargs console=${console},${baudrate} root=${mmcroot} ${hdmi_patch} fbmem=24M video=mxcfb0:dev=hdmi,1920x1080M@60,bpp=32

```

###HDMI Android

```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1 androidboot.hardware=freescale mem=1024M

```

At the next boot the video source will again be the default one unless you save the configuration you just inserted with the command:

```bash

saveenv

```

In Android you can also boot UDOO DUAL/QUAD from both HDMI and LVDS panel at the same time inserting these variables in a different frame buffer:

e.g. boot on lvds 15? and hdmi.

```bash

setenv bootargs console=ttymxc1,115200 init=/init video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32 video=mxcfb1:dev=hdmi,1920x1080M@60,if=RGB24,bpp=32 video=mxcfb2:off fbmem=28M vmalloc=400M androidboot.console=ttymxc1  androidboot.hardware=freescale mem=1024M

```

The general Purpose parameters for each video output are:

15"

```bash

video=mxcfb0:dev=ldb,1366x768M@60,if=RGB24,bpp=32

```

7" 

```bash

video=mxcfb0:dev=ldb,LDB-WVGA,if=RGB666,bpp=32

```

hdmi

```bash

video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24,bpp=32 (default environment variable)

```

<iframe width="460" height="315" src="https://www.youtube.com/embed/7CYsKJ1kqsk" frameborder="0" allowfullscreen></iframe>

##Touch Calibration

if you have any problem with touch calibration try to modify the text file:

```bash

/etc/X11/xorg.conf.d/99-calibration.conf

```

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

```

<br />

```bash

Section "InputClass"
       Identifier      "calibration"
       MatchProduct    "sitronix-i2c-touch-mt"
       Option  "Calibration"   "10 802 11 479"
EndSection

```

If the calibration is not good enough you can connect a mouse to UDOO DUAL/QUAD and launch the "Calibrate Touchscreen" application from the top bar:

```bash

Application -> System Tools -> Administration -> Calibrate Touchscreen

```

or running in a terminal the command:

```bash

xinput_calibrator

```

and follow the video instruction to change your calibration.






