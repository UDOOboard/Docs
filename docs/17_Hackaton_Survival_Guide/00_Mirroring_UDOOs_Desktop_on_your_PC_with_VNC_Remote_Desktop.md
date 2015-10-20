

If you don’t have a monitor, keyboard and mouse you can still use UDOO easily at its full potential. 
You can connect to UDOOs Remote Desktop via VNC.

To do that, just follow these steps:

### Assign a static address to your UDOO 

Edit the /etc/network/interfaces file

```bash


auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
ip 192.168.137.2
netmask 255.255.255.0
gateway 192.168.137.1

```


### Connect UDOO to your PC via a Lan Cable

### Prepare your PC Networking as follows:

<strong>On Windows:</strong>

Go to Network Settings, Select your wireless adapter and choose “Advanced Properties” then Sharing.
Share this connection with your Ethernet Adapter, and hit apply.
At this point, your pc will have 192.168.137.1 as IP

This means that UDOO will share internet connection trough your PC

<strong>On Mac OS X:</strong>

Go to settings, then Network
Set your Ethernet adaper as “Manual”
Insert the following settings

```bash
IP: 192.168.137.1
NETMASK: 255.255.255.0
GATEWAY: 192.168.137.1
Hit Apply
```

<strong>On Linux:</strong>

Edit your Network interfaces as follows:

```bash
IP: 192.168.137.1
NETMASK: 255.255.255.0
GATEWAY: 192.168.137.1
And bridge your Wireless connection with Ethernet
``` 

### Establish a remote VNC connection

Now you’re ready to power on your UDOO, make sure the SD Card with UDOOBuntu is inserted. The last step is installing and configuring a VNC Client.

<strong>On Windows:</strong>


Download and install RealVNC Viewer for Windows
Once opened, insert UDOO’s IP followed by :5901 (192.168.137.2:5901)
Insert the password: ubuntu
Done! Browse UDOO remotely with your Windows machine
 

<strong>On Mac OSX:</strong>


Download and install RealVNC Viewer for Mac
Once opened, insert UDOO’s IP followed by :5901 (192.168.137.2:5901)
Insert the password: ubuntu
Done! Browse UDOO remotely with your Mac
 

<strong>On Linux Ubuntu:</strong>


Install via terminal xvnc4viewer
```bash
sudo apt-get update
sudo apt-get install xvnc4viewer
```

Launch xvncviewer with
```bash
sudo xvncviewer
```

Insert UDOO’s IP followed by :5901 (192.168.137.2:5901)
Insert Server’s Password: ubuntu
Done! Browse Udoo remotely with your Linux machine!
More informations can be found at the [UDOO VNC Tutorial Page](http://udoo.org/tutorial/vnc-server-with-udoo/)