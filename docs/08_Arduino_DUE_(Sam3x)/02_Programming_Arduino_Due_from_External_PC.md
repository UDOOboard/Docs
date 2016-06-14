## Requirements

If you wish to program the Arduino Due-compatible side of UDOO DUAL/QUAD from your Pc, Mac or Linux computer, just follow these easy steps to get started.
First of all, check that these requirements are met:
* A working SD Card with UDOO kernel running should be present on UDOO DUAL/QUAD.
* J18 jumper should be unplugged. This will allow the communication between your computer and the programming port of the SAM3X.  


<a href="../img/boardJ18-03.png" target="_blank"><img style="width:400px; " src="../img/boardJ18-03.png"></a>


* The micro-USB cable should be plugged in the `CN6` micro-USB port.  


<a href="../img/board_usb2-01.jpg" target="_blank"><img style="width:400px; " src="../img/board_usb2-01.jpg"></a>  


* To make your external PC recognize the UDOO programming port as a COM or TTY you need to install the [CP210x USB to UART Bridge Driver](http://www.silabs.com/products/mcu/pages/usbtouartbridgevcpdrivers.aspx).  

If all the requirements above are met, you’re ready to start. What we will basically do is configure the standard Arduino-IDE in order to make it communicate to the Sam3x of UDOO DUAL/QUAD, which is the Arduino-compatible micro-controller.

## Install and configure the Arduino IDE

* From your computer go to the Arduino website and downlaod the last Arduino IDE version (currently 1.6.9): [Arduino IDE 1.6.9](https://www.arduino.cc/en/Main/Software)

* Select the OS you have in your computer and download the IDE then install it

* Open the IDE, go to File -> Preferences and add this link to Additional Boards Manager URLs:
    https://udooboard.github.io/arduino-board-package/package_udoo_index.json
then click `OK`.  

<img width="550" height="447" src="../img/ext_ard_07.png" style="margin-left: 30px;">  

<br />
<br />

* Go to Tools -> Boards and open the Board Manager.

* Wait few seconds 'till the end of the "index download" then look for `UDOO QUAD/DUAL (Arduino Due) by UDOO Team`. Click on it and install the latest version.

<img width="550" height="415" src="../img/ext_board_manager_install.PNG" style="margin-left: 30px;">

<br />
<br />

* In the board manager install also the latest version of `Arduino SAM Boards (32-bit ARM Cortex-M3) by Arduino` package. (**Note:** This is the original Arduino DUE package. Install it is needed only in the Arduino IDE 1.6.5. In the next versions install this package won't be necessary.)

* Now in Tools -> Boards you should see the `UDOO QUAD/DUAL (Arduino Due)`, if so Click on it.

<img width="550" height="587" src="../img/ext_board_manager_boards.PNG" style="margin-left: 30px;">

<br />
<br />

* Select the right Tools -> Port of the UDOO QUAD/DUAL Arduino Due

* Done, now you're ready to use your UDOO QUAD/DUAL with the Arduino IDE installed on your Computer.

**N.B:** in order to get it working on **Linux 64** bit you need compatibility packages:

```bash

$ sudo apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0

 ```
