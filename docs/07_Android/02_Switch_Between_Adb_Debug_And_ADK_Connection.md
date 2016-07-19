Android (i.MX6 side) don’t use the internal UART serial to communicate with the Arduino&trade; DUE (Atmel SAM3X side) but the native `USB OTG` bus on both sides. The i.Mx6 processor is always connected to the bus while the other side of the bus can be physically connected to:
 * The external **micro USB connector (CN3)** to communicate through adb with an External PC exactly like you do with an Android smartphone/tablet.
 * The UDOO's **Arduino&trade; DUE processor** USB Native port to make communicate an Android App and an Arduino sketch through `ADK` protocol. The switch is controlled by two i.Mx6 pins.

To power on the `USB OTG` bus you need to plug the J2 jumper on which enables the voltage supply to the bus.

## Connection with an external PC - USB Debug mode (ADB)

Since the 6.0 Marshmallow version, the default option let Android's OTG bus communicate with the external **micro USB connector (CN3)** to install, debug and test applications like a normal Android device.

The first time Android show an text alert like this.

![Allow USB Debugging](/img/android_allow_usb_dbg.png)

Android asks you to accept the fingerprint of your pc. Select the option `Always allow from this computer` and press `OK` button.

If you launch a console on your host computer and you have installed the Android SDK, you can access to UDOO DUAL/QUAD with adb protocol.

Here you can download the [Android SDK](http://developer.android.com/sdk/index.html) and get the full documentation.

Here is available the [ADB protocol guide](https://developer.android.com/studio/command-line/adb.html).

## Connection between the two Processors - Android Accessory Mode (ADK)

With this configuration **Android(i.MX6) communicates with the Arduino&trade; DUE(SAM3X)** using the `ADK protocol`. The SAM3X needs to be programmed by a sketch which includes some specific libraries then install an App on Android configured to use the ADK protocol.

By default the USB OTG bus is connected to microUSB connector(CN3). To switch the OTG bus channel and use the ADK communication follow the steps listed in the appropriate section.

## Switching between modes

### GUI Switch


<div>
 <ul id="adc-examples" class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#android6" aria-controls="windows" role="tab" data-toggle="tab">Android 6.0.1 Marshmallow</a></li>
  <li role="presentation"><a href="#android4" aria-controls="mac" role="tab" data-toggle="tab">Android 4.4.2 Kitkat</a></li>
 </ul>

 <div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="android6">

Since the 6.0 Marshmallow version, the UDOO Android distro comes with a custom `UDOO` section in Setting App to configure custom options for UDOO boards.

![OTG](/img/android_setting/setting_udoo_intotg.png)

Visit the previous [UDOO Android Setting](../Android/UDOO_Android_Setting.html) section.

  </div>
  <div role="tabpanel" class="tab-pane" id="mandroid4">

You can automatically switch between modes using the options menu checkbox.

Starting from home screen press on the application menu button.

Press the Settings button

From the left menu, under System, select “Developer options”

Under Debugging find this checkbox:

    External OTG port enabled
    Enable external OTG port for allow USB debugging (Warning: enabling external OTG port will disconnect internal communication with Arduino)

If External OTG port enabled is selected you can access the Android adb from an external computer.

If not the OTG is shared between i.Mx6 and SAM3X (so they can communicate with ADK protocol and use them together.)

  </div>
 </div>
</div>
<script>
$('#adc-examples a').click(function (e) {
e.preventDefault()
$(this).tab('show')
})
</script>

### Console Switch

Connect a microUSB cable to CN6 and plugging the J18 jumper then access to the UART serial with a terminal application (e.g Teraterm, Minicom, Serial Tools).

When you access the Android console you can switch between two modes.

Switch from INTERNAL ADK mode (i.Mx6 <-> SAM3X) to Debug Mode (microUSB plugged in CN3)


```bash

sudo -s
echo 0 > /sys/class/gpio/gpio203/value  
echo 0 > /sys/class/gpio/gpio128/value

```

Switch from Debug Mode (microUSB plugged in CN3) to INTERNAL ADK mode (i.Mx6 <-> SAM3X)

```bash

sudo -s
echo 1 > /sys/class/gpio/gpio128/value  
echo 1 > /sys/class/gpio/gpio203/value

```

When you switch from Debug to ADK mode, after you sent the two commands, you may need to reset the SAM3X and plug and unplug the J16 jumper. If you loaded a sketch that implements ADK protocol you should see an alert noticing you that the Android Accessory is now connected. If there is an app that matches the id on the Arduino sketch the alert asks you if you want to open this app.

On the top-left menu there is also a message that remind you the Accessory Connection.
