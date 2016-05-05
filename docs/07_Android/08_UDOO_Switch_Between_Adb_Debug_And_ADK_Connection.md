Android don’t use the uart serial to communicate with the Atmel SAM3X microcontroller but the native USB OTG bus on both sides. The i.Mx6 processor is always connected to the bus while the other side of the bus can be switched between SAM3X microcontroller and the external microUSB CN3. The switch is controlled by two i.Mx6 pins.

To power on the OTG USB bus you need to plug the J2 jumper on which enables the voltage supply to the bus.

## Android Accessory Mode

By default the Android OTG BUS is switched to SAM3X, the starting connection is between the two processors which means that if you plug an USB cable to the CN3 connector it doesn’t work.

With this configuration the i.Mx6 communicates with the SAM3X using the ADK protocol. The SAM3X needs to be programmed by a sketch which includes some specific libraries then install an app on Android configured to use the ADK protocol.

## USB Debug mode

UDOO DUAL/QUAD can use the Android Debug Bridge (adb) to to install debug and test applications like a normal Android device. To do so you need to switch the OTG bus to the microUSB port, then connect your personal computer to the CN3 microUSB port and use the standard adb tools on UDOO DUAL/QUAD.

By default the OTG bus is connected to SAM3X. To switch the OTG bus channel and use the adb protocol follow the steps listed in the appropriate section.

The first time Android show an text alert like this.

```bash

Allow USB debugging? 
The computer's RSA key fingerprint is:
01:23:45:67:89:AB:CD:EF:01:23:45:67:89:AB:CD:EF
[] Always allow from this computer

```

Android asks you to accept the fingerprint of your pc. Select the option “Always allow from this computer” and press ok button.

If you launch a console on your host computer and you have installed the Android SDK, you can access to UDOO DUAL/QUAD with adb protocol.

You can download the Android SDK and get the full documentation here: http://developer.android.com/sdk/index.html

The ADB protocol guide is available here: http://developer.android.com/tools/help/adb.html

## Switching between modes

### GUI Switch

You can automatically switch between modes using the options menu checkbox.

Starting from home screen press on the application menu button.

Press the Settings button

From the left menu, under System, select “Developer options”

Under Debugging find this checkbox:

```bash

External OTG port enabled
Enable external OTG port for allow USB debugging (Warning: enabling external OTG port will disconnect internal communication with Arduino)

```

If External OTG port enabled is selected you can access the Android adb from an external computer.

If not the OTG is shared between i.Mx6 and SAM3X (so they can communicate with ADK protocol and use them together.)

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









