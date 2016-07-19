## Overview

Since the 6.0 Marshmallow version, the UDOO Android distro comes with a custom `UDOO` section in Setting App to configure custom options for UDOO boards.

<img style="width:600px; height:338px" src="../img/android_setting/setting_udoo.png">   

In `General` you can find misc custom options to set video output, audio device, processor's governor, OTG communication and reboot Android in recovery.

<img style="width:600px; height:338px" src="../img/android_setting/setting_udoo_general.png">

## Select Video Output

In UDOO QUAD/DUAL you have three options as video output.

 * [LVDS 7"](http://shop.udoo.org/accessories/video-kit-7-touch-for-quaddual.html)
 * [LVDS 15"](http://shop.udoo.org/accessories/video-kit-15-6-lvds-for-quaddual.html)
 * HDMI

The default one at boot is HDMI.

<img style="width:700px; height:281px" src="../img/android_setting/setting_udoo_vidout.png">

## Enable internal Arduino Communication (ADK)

The i.MX6 `USB OTG` bus can be physically connected to:
 * The external **micro USB connector (CN3)** to communicate through adb with an External PC exactly like you do with an Android smartphone/tablet.
 * The UDOO's **Arduino&trade; DUE processor** USB Native port to make communicate an Android App and an Arduino sketch through `ADK` protocol.

Visit the `External OTG connection to i.MX6` and `OTG connection between i.MX6 and SAM3X` sections in the page [i.MX6 and Sam3X Communication](../Hardware_&_Accessories/IMX6_And_Sam3X_Communication.html) to find more info about.

Since the 6.0 Marshmallow version the default option let UDOO's OTG bus communicate with and external PC (ADB). Check this option to make an Adroid App communicate with the UDOO's Arduino&trade; DUE processor.

<img src="../img/android_setting/setting_udoo_intotg.png">

Visit the [Switch Between Adb Debug and ADK Connection](../Android/Switch_Between_Adb_Debug_and_ADK_Connection.html) to find more info about how to change the iMX^ USB OTG physically connection.


## Select the Processor's Governor

You can select a CPU governor among one of:

 * `conservative`: Dynamically switch between CPU(s) available if at 75% load.
 * `ondemand`: Dynamically switch between CPU(s) available if at 95% cpu load.
 * `userspace`:	Run the cpu at user specified frequencies.
 * `powersave`:	Run the cpu at the minimum frequency.
 * `interactive`: dynamically scales CPU clockspeed in response to the workload placed on the CPU by the user. Significantly more responsive than ondemand.
 * `performance`:	Run the cpu at max frequency.

<img style="width:700px; height:281px" src="../img/android_setting/setting_udoo_gov.png">

## Select Audio device

You can select the Output Audio Device among one of:

 * HDMI (imx-hdmi-soc) : audio from the HDMI monitor
 * OnBoard (vt1613-audio) : audio from the green speaker 3.5mm jack.

<img style="width:700px; height:281px" src="../img/android_setting/setting_udoo_auddev.png">

You need to reboot Android to apply this change.


## Reboot in TWRP recovery

Since Android 6.0 Marshmallow version the UDOO Android distro provides [TWRP recovery](https://twrp.me/).

Booting Android in Recovery mode allow you to install zip update package. For example you can install the [Open GApps](http://opengapps.org/) packages to install Google Apps.

<img src="../img/android_setting/setting_udoo_recovery.png">

You can find an exhaustive guide of [how to install Gapps](../Android/How_To_Install_Gapps_On_UDOO_Running_Android.html) here.

Another way to boot the Android Distro in recovery mode is run the following command in the U-Boot console through the [Serial Connection](../Basic_Setup/Connecting_Via_Serial_Cable.html):

    run recovery cmd
