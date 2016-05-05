## Programming the Arduino embedded from UDOO DUAL/QUAD itself

With the Arduino IDE for UDOO DUAL/QUAD is it possible to write code and upload it to the Arduino DUE embedded on UDOO DUAL/QUAD, from UDOO DUAL/QUAD itself.

Check if the Arduino IDE for UDOO DUAL/QUAD is already installed on your system, if not the IDE comes already installed with the [latest UDOObuntu image files](http://www.udoo.org/downloads/#tab1) available on UDOO DUAL/QUAD's website, or, as an alternative, you can [download the IDE alone](http://www.udoo.org/downloads/#tab4) and install it. 
[How to install Arduino IDE for UDOO](/docs/Tutorials/UDOO_Install_The_Arduino_IDE).

The Arduino IDE for UDOO DUAL/QUAD comes already configured to see the Arduino DUE embedded programming port on the internal serial (/dev/ttymxc3) so is ready to use.

Note: the Arduino IDE for UDOO DUAL/QUAD is a custom version of the official Arduino IDE 1.5.4 and is shared alike. The UDOO team work has been focused mainly on the compiler.

## Programming the Arduino embedded microcontroller from an external computer

To program the Atmel SAM3X from an external computer, you can use the standard Arduino IDE on your computer, connected to UDOO DUAL/QUAD through USB to microUSB cable, plugged to CN6 connector. Download the Arduino IDE version 1.5 for your specific operating system from the [official website](http://arduino.cc/en/Main/Software), then install it on your computer. Only version 1.5 or higher will work with the Arduino DUE embedded on UDOO DUAL/QUAD.

Note: remember to unplug J18 jumper. This will allow the communication between your computer and the programming port of the SAM3X.

### Using Arduino IDE with UDOO DUAL/QUAD patch

The easiest way to program the Arduino DUE embedded from an external computer is by patching the Arduino IDE. The Atmel Sam3X microcontroller needs to receive ERASE and RESET signals when programming it with a new sketch. On Arduino boards this operation is performed by the microcontroller ATmega16U2 while on UDOO DUAL/QUAD this component is not present. The patch resolves this issue.

Download the patch for the appropriate OS [here](http://www.udoo.org/downloads/#tab4).

In Windows or Linux extract the files from the archive you just download and move them to the following path overriding the originals files.

```bash

<ARDUINO_IDE_PATH>/hardware/tools/

```

In OSX, right click on the Arduino IDE Application and select “Show package contents”, then override the extracted file(bossac) into:

```bash

<ARDUINO_IDE_PACKAGE>/Contents/Resources/Java/hardware/tools/

```

With this patch you are now able to upload your sketch selecting the Arduino Due(Programming Port) from Tools -> Board and the right port from Tools -> Port in the Arduino IDE.

### Using Arduino IDE without UDOO DUAL/QUAD patch

A different way for programming the Arduino side without applying patches consists in stopping the board at U-boot stage before the Kernel is loaded

To do so you’ll have to:

* Download and install a serial monitor program (Teraterm for Windows, Minicom for Linux, serial tools for OS X). Please check the appendix for the configuration and the parameters of these software tools.
* Connect the external Host PC through the microUSB port CN6, taking care that jumper J18 is plugged.
Then insert the power plug and start the system. On the serial monitor it will appear something similar:

```bash

U-Boot 2009.08 (Sep 27 2013 - 12:30:44)
   CPU: Freescale i.MX6 family TO1.2 at 792 MHz
   Thermal sensor with ratio = 181
   Temperature:   50 C, calibration data 0x5774fa69
   mx6q pll1: 792MHz
   mx6q pll2: 528MHz
   mx6q pll3: 480MHz
   mx6q pll8: 50MHz
   ipg clock     : 66000000Hz
   ipg per clock : 66000000Hz
   uart clock    : 80000000Hz
   cspi clock    : 60000000Hz
   ahb clock     : 132000000Hz
   axi clock     : 264000000Hz
   emi_slow clock: 132000000Hz
   ddr clock     : 528000000Hz
   usdhc1 clock  : 198000000Hz
   usdhc2 clock  : 198000000Hz
   usdhc3 clock  : 198000000Hz
   usdhc4 clock  : 198000000Hz
   nfc clock     : 24000000Hz
   Board: i.MX6Q-UDOO: unknown-board Board: 0x63012 [WDOG]
   Boot Device: NOR
   I2C:   ready
   DRAM:   1 GB
   MMC:   FSL_USDHC: 0,FSL_USDHC: 1,FSL_USDHC: 2,FSL_USDHC: 3
   In:    serial
   Out:   serial
   Err:   serial
   Net:   got MAC address from IIM: 00:00:00:00:00:00
   FEC0 [PRIME]
   Hit any key to stop autoboot:  3
   Hit any key to stop autoboot:  2
   Hit any key to stop autoboot:  1

```

* Before the counter reaches 0, press any key on the external PC’s serial console.

```bash

i.Mx6Q_UDOO_BOOT> _

```

* Close the serial monitor and unplug J18 jumper. This will allow the communication with the programming port of SAM3X;

* Plug the jumper J22 for 1 second, then remove it (to erase the old sketch programmed in SAM3X);

* Plug the jumper J16 for 1 second, thend remove it (to reset the SAM3X);

* Select from the IDE: Tools –> Board –> Arduino DUE programming port and select the correct serial COM from the IDE;

* Send the sketch using the IDE upload button.

* Press the reset button to restart i.MX6 and use Ubuntu or Android again.










