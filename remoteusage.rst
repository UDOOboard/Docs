#########################
Operating UDOO Remotely
#########################


====================
Connecting via SSH
====================


SSH basically enables you to remotely operate a device, connected to a network, without direct physical access. 

To access your Udoo via a remote shell check that these requirements are satisfied:

 - You are connected to the same network that Udoo is. This can be your home router, with Udoo connected via Ethernet cable and your Laptop trough wireless connection
 - You don’t have firewalls enabled that could block the communication between the two devices
 - Check that the two devices are on the same subnet, if you don’t know what that means, you can just ignore this.
 
**WINDOWS**



Let’s start. On windows, you need a third party software, called putty.

`Download it from here <_utils/putty.exe>`_

Open it and insert Udoo’s IP. Call it UDOO, save it for your future convenience and hit load.

.. image:: _static/images/putty2.png


Now, you’ll be prompted with a login box. Just enter user and password of your O.S. and you’re in.

.. image:: _static/images/putty4.jpg

**On Udoo’s Ubuntu, user and password are both ubuntu**

**Mac Os X and Linux**

On both these operating system, the procedure is quite the same.

You just need to open a terminal and use the following synthax::

  ssh username@Udoo_Ip
  
  
.. image:: _static/images/sshmacelinux2.jpg

Then hit enter, bear in mind that the very first time you are doing this, you’ll be prompted with a securty pop-up. 
To confirm, type “yes”.

Then type the password and you’re in.

.. image:: _static/images/sshmacelinux2.jpg

**Please note:** The username and password you are requested to enter while logging via SSH are not pertaining to your Pc, Mac or Linux, they refer to the account you are trying to access on Udoo.
So, if you never changed it, the credentials you need are::
  User: ubuntu
  Password: ubuntu
  **For root access:**
  User: root
  Password: ubuntu


==============================
Connecting via USB Serial Cable
==============================

Udoo features a built in USB to serial interface which is very useful for various reasons: 
 - You can use it to connect Udoo via SSH without a network connection, 
 - Program the Sam3x (Arduino) from your PC
 - Access the debug console for troubleshooting purposes

Connecting via serial will practically result in a shell console, the same as the one you’ll obtain through SSH connection


**Connecting via Serial from Windows**

 - Install the `Serial Adapter Driver <_utils/CP210x_VCP_Windows.zip>`_
 - Open `Putty <_utils/putty.exe>`_ and configure it as follows:


 - Connection type “serial”
 - Port: “COM3” (please note that this value may be different, try to use COM4 if COM3 is not working)
 - Speed: “115200”
 - Save it as “Udoo-serial” for future uses.
 
 
.. image:: _static/images/udooserial1win.png

 - Connect the serial port of UDOO (CN6) to your PC using the micro USB cable.
 - Power up UDOO
 - Click Open

**You’re in! You’ll be able to see the startup process and access to the remote shell console on UDOO.**

.. image:: _static/images/udoowin2.png


**Connecting via Serial from Linux**

Connect the serial port of UDOO (CN6) to your PC using the micro USB cable. And type::
  dmesg

You should see this line at the end::

  usb 2-2.1: cp21x converter now attached to tty

Install minicom::

  sudo apt-get update
  sudo apt-get install minicom

Open Minicom and configure it (only the first time) using the following commands::

  sudo minicom -sw

Go to “Serial port setup” and edit as follows::
  Serial Device: /dev/ttyUSB0 (type a key)
  Hardware Flow Control: No (type f key)
  Software Flow Control: No (type g key)


Press exit and “Save setup as dfl” and exit from Minicom

Let’s give proper access permissions to serial port with::

  sudo chmod 666 /dev/ttyUSB0

Now we can start listening with::

  sudo minicom -w

Power cycle UDOO to see the boot process and connect it to serial console shell


**Connecting via Serial from Mac**

Download the serial adapter Driver here:
http://www.silabs.com/products/mcu/pages/usbtouartbridgevcpdrivers.aspx
Connect the serial port of UDOO (CN6) to your PC using the micro USB cable.
Download and install Serial Tools https://itunes.apple.com/it/app/serialtools/id611021963 or directly from the Apple 
Store
Open Serial Tools, and change the following parameters:
Serial Port: “SLEB_USBtoUART”
Baud rate “115200”


Hit connect, and here you go!

===================================
Connect via VNC Remote Desktop
===================================

Welcome to this Remote Desktop Tutorial. As you may imagine, what we are going to achieve is all about convenience. 
Some of you could be pretty familiar with Remote Desktop Utilities, for the ones who aren’t, just think that you can use
a device (in this case, UDOO) like you were sitting in front of that, using it’s keyboard and mouse and looking at its 
screen, except you can do that also from the other part of the world. You don’t need to be a globetrotter then to enjoy 
this capability, Remote Desktop is also very useful in home situations, when simply you just want to use UDOO without 
connecting a mouse, a monitor and a keyboard to it.

Open source software gives us a chance to achieve this result without getting too much in troubles, here is what you 
need to do to have it running.


Now you just need to download a client app and use UDOO’s IP to connect to it, followed by the VNC port ( default 5901) Let’s see how:

On Windows:

Download and install RealVNC Viewer
Once opened, insert UDOO’s IP followed by :5901 (e.g. 192.168.0.105:5901)
Insert the password you previously set on the Server and hit Connect
Done! Browse UDOO remotely with your Windows machine
On Mac OSX:

Download and install RealVNC Viewer
Once opened, insert UDOO’s IP followed by :5901 (e.g. 192.168.0.105:5901)
Insert the password you previously set on the Server and hit Connect
Done! Browse UDOO remotely with your Mac
On Linux Ubuntu:

Install via terminal xvnc4viewer
1
sudo apt-get update

1
sudo apt-get install xvnc4viewer
Launch xvncviewer with
1
sudo xvncviewer
Insert UDOO’s IP followed by :5901
1
192.168.1.0.105:5901
Insert Server’s Password
Done! Browse Udoo remotely with your Linux machine!


