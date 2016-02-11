If you prefer, you can choose to program UDOO DUAL/QUAD’s Arduino from your PC, these are the required steps.

<strong>Please note that  a working SD Card should be present on UDOO DUAL/QUAD</strong>

###Unplug J18 jumper  
This will allow the communication between your computer and the programming port of the SAM3X


<img src="/docs/img/boardJ18-03.png" alt="alt text" class="img-responsive" height="441px" width="350px"  style="margin-bottom:20px; margin-left:30px;"><br>



### Connect a Micro USB cable to CN6 serial/programming port.
<img src="/docs/img/board_usb2-01.jpg" alt="alt text" class="img-responsive " height="441px" width="350px"  style="margin-left:30px;"><br>



### Install the serial drivers

Install the driver for the cn6 MicroUSB port that allows the correct communication between your external computer and UDOO DUAL/QUAD (choose the correct Operating System of your Computer).

* [Windows](/docs/driversandtools/CP210x_VCP_Windows.zip)
* [MacOsX](/docs/driversandtools/Mac_OSX_VCP_Driver.zip)
* [Linux 3.X](/docs/driversandtools/Linux_3.x.x_VCP_Driver_Source.zip)
* [Linux 2.6.X](/docs/driversandtools/Linux_2.6.x_VCP_Driver_Source.zip)

### Patch the Arduino IDE

Now, let’s  configure the standard Arduino-IDE in order to make it communicate to the Sam3x of UDOO DUAL/QUAD. 
To do it we need to patch the official Arduino IDE:

Download and install the Arduino IDE version 1.5 for your specific operating system from [Arduino Website](http://arduino.cc) (other versions will not work, since UDOO DUAL/QUAD needs Arduino 2 compabile programming software)

Download the patch for your Operating system:

* [Windows](/docs/driversandtools/bossac_windows.zip)
* [MacOsX](/docs/driversandtools/bossac_osx.zip)
* [Linux64](/docs/driversandtools/bossac_linux64.tar.gz)
* [Linux32](/docs/driversandtools/bossac_linux32.tar.gz)

Extract the files in the archive and place them in the following paths, overwriting the previous existing files:

 <strong>Windows 32 bit:</strong><br>
 C:\Program Files\Arduino\hardware\tools<br>
 
 <strong>Win 64 bit:</strong><br>
 C:\Program Files (x86)\Arduino\hardware\tools<br>
 
 <strong>Linux:</strong><br>
 /hardware/tools/<br>
 
 <strong>Mac OS X:</strong><br>
 /Contents/Resources/Java/hardware/tools/<br>

With this patch you are now able to upload your sketch selecting the Arduino Due(Programming Port) from:<br>
<br>
 Tools -> Board and the right port from Tools -> Port in the Arduino IDE<br>
