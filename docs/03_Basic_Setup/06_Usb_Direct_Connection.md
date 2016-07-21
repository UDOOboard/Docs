### What is USB Direct Connection

UDOO Dual/Quad's Micro USB port can be used both to power up the board and to connect it to our computer.

Connecting UDOO Dual/Quad to your computer will result in:

* UDOO Dual/Quad powering on, taking power from its USB Port
* A storage device will be available, containing UDOO Dual/Quad'S Kernel and DTB files, together with an offline documentation and quick start guide
* UDOO Dual/Quad will establish a network connection with your Computer, allowing to use it in [headless mode](../Getting_Started/Use_as_a_headless_IoT_Device.html)

In order to use UDOO Dual/Quad'S USB Connection on Mac and Windows, you must install few drivers first as described below:

## Enable USB Direct Connection: Installing Drivers

Linux doesn't need drivers to make USB connection work properly. For other OS follow the instuctions below.

### Installing Drivers on Mac OS X

* Install both of this drivers: [Serial](../driversandtools/Mac%20USB%20Drivers/EnergiaFTDIDrivers2.2.18.pkg) and [Network](../driversandtools/Mac%20USB%20Drivers/HoRNDIS.pkg)

<span class="label label-warning">Heads up!</span> If you're using the Newest `OSX EL CAPITAN` please install this [Network Driver](http://nyus.joshuawise.com/HoRNDIS-rel8pre1.pkg) insted.

* Reboot your MAC
* UDOO Dual/Quad will be available at [192.168.7.2](http://192.168.7.2)

### Installing Drivers on Windows

* Connect UDOO Dual/Quad via Micro USB Cable to PC, eventually you'll get the following message:

<img style="width:500px;" src="../img/win_drv/wd_01.jpg">

* Right click on Computer and select Manage. From System Tools, select Device Manager. It will show a list of devices currently connected with the development PC. In the list, RNDIS Kitl can be seen with an exclamation mark implying that driver has not been installed.

<img style="width:500px;" src="../img/win_drv/wd_02.jpg">

* Right click on it and select Update Driver Software... When prompted to choose how to search for device driver software, choose Browse my computer for driver software.

* Browse for driver software on your computer will come up. Select Let me pick from a list of device drivers on my computer.

* A window will come up asking to select the device type. Select Network adapters, as RNDIS emulates a network connection.

<img style="width:500px;" src="../img/win_drv/wd_03.jpg">

* In the Select Network Adapter window, select Microsoft Corporation from the Manufacturer list. Under the list of Network Adapter:, select Remote NDIS compatible device.

<img style="width:500px;" src="../img/win_drv/wd_04.jpg">

* The RNDIS Kitl device is now installed and ready for use.

<img style="width:500px;" src="../img/win_drv/wd_05.jpg">

## Use USB Direct Connection to control UDOO Dual/Quad

* Upon successful connection, UDOO Dual/Quad will be available at the address [192.168.7.2](http://192.168.7.2)
* You can establish a <a href="../Basic_Setup/Remote_Terminal_(SSH).html">SSH Remote Terminal</a> using the address 192.168.7.2 with credentials udooer/udooer
* You can establish a <a href="../Basic_Setup/Remote_Desktop_(VNC).html">VNC Remote Desktop</a> Session using the address 192.168.7.2 and port 5900 (192.168.7.2:5900). The default password is udooer.
* You can configure UDOO Dual/Quad via the [Web Control Panel](../Basic_Setup/Web_Control_Panel.html)

## Troubleshooting

* If your UDOO Dual/Quad doesn't appear as a mass storage or is not recognized by your MAC\Pc, this may be due to insufficient power output from the USB port it is attached to. Therefore, try to:

- Change the USB port it is plugged into, to be on the safe side plug UDOO Dual/Quad to USB 3.0
- If you're on a Laptop, disable USB Power Saving mode
- Try to use a powered USB HUB
