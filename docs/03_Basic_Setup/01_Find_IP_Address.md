## Overview

Visit our Tutorials section to learn more about: [Find IP Address](/tutorial/find-ip-address/).

We’ll find out how to discover the IP address associated with your UDOO DUAL/QUAD. The IP address is a number that uniquely identifies a device in a network. It will be useful to know which IP your UDOO DUAL/QUAD is assigned to for various reasons: connecting to it remotely, knowing wheter UDOO DUAL/QUAD is booting properly or not and configure it to interact correctly into a given network.
We’ll have various way to find the IP Address, so let’s get started.


## First method: command line

If your UDOO QUAD/DUAL is connected to a screen (or via serial cable like explained in the previous page), you can simply open a terminal and type:

```bash

sudo ifconfig -a

```

This command will output informations related to both Ethernet and Wi-Fi status, including respective IP addresses.

<img class="alignnone size-full wp-image-2488" src="../img/ubuntu.jpg" alt="ubuntu" width="500" height="281" />


## Second method: use the FING app

Fing is a network scanner app, which will help you to discover every device connected into your network. Simply go to the Android or Ios market, download and launch it. If UDOO DUAL/QUAD is properly connected to the same network your phone is (wheter via Wi-Fi or ethernet), you should see it and discover its IP address.

<img class="alignnone size-full wp-image-2486" src="../img/ipAddress.jpg" alt="ipAddress" width="500" height="193" />

As you can see, UDOO DUAL/QUAD is identified as: Shenzen Ogemray Technology.


## Third method: use your router’s control pane

Just connect to your router’s control panel: open your browser and type the IP address of your router. Usually this is 192.168.1.1 or 192.168.0.1 or 192.168.1.254.
Once you’re prompted with a user and password login box, log in ( if you’ve not changed them, there are good chances they would be: admin as both user and password).
Navigate to the devices list,which can be called also status or manteinance, you should see your UDOO DUAL/QUAD with his IP address.

Here you are. Now that you know your IP address, you can easily access your UDOO DUAL/QUAD
