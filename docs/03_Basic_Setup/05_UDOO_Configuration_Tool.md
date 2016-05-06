<div class="alert alert-danger" role="alert">
  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  <span class="sr-only">Warning!</span>
  This tool is deprecated since UDOObuntu 2.0. It is present only in UDOObuntu 1.0/1.1 versions.<br>
  On UDOObuntu 2 use <a href="Web_Control_Panel.html">Web Control Panel</a> instead.
</div>

UDOO DUAL/QUAD Configuration Tool is a utility created to assist UDOO DUAL/QUAD basic and advanced Configuration. It comes preinstalled on UDOOBuntu Official UDOO DUAL/QUAD Operating system.


<img src="../img/configuration_tool.png">

## Tool Overview

UDOO DUAL/QUAD configuration Tool has several subsections:

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

This allows to enable UDOO DUAL/QUAD LVDS Panel, 7 or 15 inches. A reboot is required to enable them.


* **Enable UDOO Camera Module**

This enables the Camera Module. A service is required to enable the loopback device. [More informations about UDOO Camera Modules](../Hardware_&_Accessories/UDOO_Camera_Module.html)


* **U-Boot**

Shows Current U-Boot environment.

* **Change Ram mem layout**

This changes the quantity of memoery to allocate to the video card and to the framebuffer.

* **Reset env**

This resets the environment

 * **Show env**

This shows the env
