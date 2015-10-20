UDOO Configuration Tool is a utility created to assist UDOO basic and advanced Configuration. It comes preinstalled on UDOOBuntu Official UDOO Operating system.


<img src="/docs/img/configuration_tool.png">

## Tool Overview

UDOO configuration Tool has several subsections:

* **Change User Password**
Selecting this you'll be able to change default password for user ubuntu.

It is what you'll achieve by manually doing:

```bash

passwd

```

* **Change Keyboard Layout**

This changes default keyboard layout.

* **Change Timezone Settings**

This changes default timezone setting. This affects the Network Time Timezone Setting and sometimes can solve Networking Problems.


* **Change Remote Desktop Password**

This changes the default Password of VNC Server. Default is ubuntu.


* **Expand Filesystem to fill disk max capacity**

This expands filesystem of current Root Partition to fill the disk capacity.


* **Set Default Boot Device**

This edits Uboot Environment allowing to select default Boot Device from MicroSD Card, SATA Drive or NFS.


* **Set Default Video Output (LVDS/HDMI)**

This allows to enable UDOO LVDS Panel, 7 or 15 inches. A reboot is required to enable them.


* **Enable UDOO Camera Module**

This enables the Camera Module. A service is required to enable the loopback device. [More informations about UDOO Camera Modules](/docs/Resources/UDOO_Camera_Module)


* **U-Boot**

Shows Current U-Boot environment.

* **Change Ram mem layout**

This changes the quantity of memoery to allocate to the video card and to the framebuffer.

* **Reset env**

This resets the environment
 
 * **Show env**

This shows the env 




