The UDOO's Web Control Panel is a utility designed to:

* Easily configure your UDOO QUAD/DUAL, from the Wireless Connection to the UDOO QUAD/DUAL's hostname;
* Check its connection status;
* Learn how to develop basic projects;
* Test simple Arduino sketches on the fly;
* Expose the Documentation;

### How to connect to the UDOO Web Control Panel

Make sure UDOO QUAD/DUAL and your host computer are connected to the same network, so open a browser in your host computer and type the IP address of UDOO QUAD/DUAL.

You can use the UDOO Web Control Panel directly from the UDOO running UDOObuntu finding the link in the application panel in the section "Preferences" -> "UDOO Web Configuration" 

#### Dashboard

<a href="../img/webconf/home.png" target="_blank"><img style="width:700px;" src="../img/webconf/home.png"></a>

The Dashboard gives you a quick insight on the status of your UDOO QUAD/DUAL:

 * At the top, you'll find an overview of board's connectivity, indicating whether Ethernet, USB, Wlan and Bluetooth are connected, and their IP address;
 * In the center, you can find board model and unique ID. On the right, there are axis and modulus values for the Accelerometer, Gyroscope and Magnetometer;
 * The other tiles are the starting point on discovering UDOO QUAD/DUAL's capabilities.


#### Configuration

This section helps you to configure your board and connect it to a wireless network:

 * On "Password and hostname", you can change your passwords and set a name for your board;
 * On "Network settings", you can connect to Wi-Fi networks;
 * On "Regional settings" you can set the locale, timezone and regional settings;
 * On "Advanced settings" you can change the main video output device (e.g. HDMI or LVDS), enable/disable the Arduino core and change the TCP port where the Web Control Panel operates (so you can, for example, install a webserver on your board, like Apache or nginx),

 <a href="../img/webconf/wifi.png" target="_blank"><img style="width:700px;" src="../img/webconf/wifi.png"></a>

 <a href="../img/webconf/regional.png" target="_blank"><img style="width:700px;" src="../img/webconf/regional.png"></a>
