## Overview

Visit our Tutorials section to learn more about: [Connecting Via Serial Cable](/tutorial/connecting-via-serial-cable/).

UDOO DUAL/QUAD features a built in USB to serial interface which is very useful for various reasons: You can use it to connect UDOO DUAL/QUAD via SSH without a network connection, programming the Sam3x (arduino) and access the debug console for troubleshooting purposes.

Connecting via serial will practically result in a shell console, the same as the one you’ll obtain through SSH connection [http://en.wikipedia.org/wiki/Secure_Shell](http://en.wikipedia.org/wiki/Secure_Shell).

<div>
 <ul id="adc-examples" class="nav nav-tabs" role="tablist">
  <li role="presentation" class="active"><a href="#windows-example" aria-controls="windows" role="tab" data-toggle="tab">Windows</a></li>
  <li role="presentation"><a href="#mac-example" aria-controls="mac" role="tab" data-toggle="tab">Mac OS X</a></li>
  <li role="presentation"><a href="#linux-example" aria-controls="linux" role="tab" data-toggle="tab">Linux</a></li>
 </ul>

 <div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="windows-example">

## Connecting via Serial from Windows

* Download the serial adapter Driver here:
<a href="http://www.silabs.com/products/mcu/pages/usbtouartbridgevcpdrivers.aspx">http://www.silabs.com/products/mcu/pages/usbtouartbridgevcpdrivers.aspx</a>

* Install the proper version for your Operating system:
CP210xVCPInstaller_x86.exe for 32-bit systems
CP210xVCPInstaller_x64.exe for 64-bit system

* How to define your Windows version:
<a href="http://windows.microsoft.com/en-us/windows7/32-bit-and-64-bit-windows-frequently-asked-questions">http://windows.microsoft.com/en-us/windows7/32-bit-and-64-bit-windows-frequently-asked-questions</a>

* Download and install a software called putty
<a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html">http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html</a>

* Open putty and configure it as follow:
Connection type <strong>“serial”</strong>
Port: <strong>“COM3”</strong> (please note that this value may be different, check the number of the COM assigned in Windows Device Manager)
Speed: <strong>“115200”</strong>
Save it as <strong>“Udoo-serial”</strong> for future uses.

<br />

<img class="alignnone size-full wp-image-2510" src="../img/udooserial1win.png" alt="udooserial1win" width="466" height="448" style="margin-left: 30px;"/>

<br />
<br />

* Connect the serial port of UDOO DUAL/QUAD (CN6) to your PC using the micro USB cable.

* Power up UDOO DUAL/QUAD

* Click Open

* You’re in! You’ll be able to see the startup process and access to the remote shell console on UDOO DUAL/QUAD.

<br />

<img class="alignnone size-full wp-image-2511" src="../img/udoowin2.png" alt="udoowin2" width="500" height="314" style="margin-left: 30px;"/>

<br />

</div>
<div role="tabpanel" class="tab-pane" id="linux-example"

## Connecting via Serial from Linux

* Connect the serial port of UDOO DUAL/QUAD (CN6) to your PC using the micro USB cable.

* Type

```bash

 dmesg

 ```

* You should see this line at the end

```bash

 usb 2-2.1: cp21x converter now attached to tty

 ```

<img class="alignnone size-full wp-image-2512" src="../img/Linux1.png" alt="Linux1" width="500" height="355" />

* Install minicom:

```bash

sudo apt-get update
sudo apt-get install minicom

```

* Open Minicom and configure it <strong>(only the first time)</strong> using the following command:

```bash

 sudo minicom -sw

 ```

* Go to <strong>“Serial port setup”</strong> and edit as follow:
Serial Device: /dev/ttyUSB0 (type a key)
Hardware Flow Control: No (type f key)
Software Flow Control: No (type g key)

<img class="alignnone size-full wp-image-2513" src="../img/Linux2.png" alt="Linux2" width="500" height="355" />

* Press exit and <strong>"Save setup as dfl"</strong>

* Exit from Minicom

* Let’s give proper access permissions to serial port with:

```bash

 sudo chmod 666 /dev/ttyUSB0

 ```

* Now we can start listening with:

```bash

 sudo minicom -w

 ```

* Power cycle UDOO DUAL/QUAD to see the boot process and connect it to serial console shell


</div>
<div role="tabpanel" class="tab-pane" id="mac-example">

## Connecting via Serial from Mac

* Download the serial adapter Driver here:
<a href="http://www.silabs.com/products/mcu/pages/usbtouartbridgevcpdrivers.aspx">http://www.silabs.com/products/mcu/pages/usbtouartbridgevcpdrivers.aspx</a>

* Connect the serial port of UDOO DUAL/QUAD (CN6) to your PC using the micro USB cable.

* Download and install Serial Tools <a href="https://itunes.apple.com/it/app/serialtools/id611021963">https://itunes.apple.com/it/app/serialtools/id611021963</a> or directly from the Apple Store

* Open Serial Tools, and change the following parameters:
Serial Port: <strong>“SLEB_USBtoUART”</strong>
Baud rate <strong>“115200”</strong>

<img class="alignnone size-full wp-image-2514" src="../img/Mac1.png" alt="Mac1" width="500" height="142" />

* Hit connect, and here you go!

<img class="alignnone size-full wp-image-2515" src="../img/Mac2.png" alt="Mac2" width="500" height="207" />

</div>
</div>
</div>
<script>
$('#adc-examples a').click(function (e) {
e.preventDefault()
$(this).tab('show')
})
</script>
