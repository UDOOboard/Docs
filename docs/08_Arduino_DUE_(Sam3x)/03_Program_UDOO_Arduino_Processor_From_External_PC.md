## Overview

Visit our Tutorials section to learn more about: [Program UDOO's Arduino Processor From External PC](/tutorial/program-udoos-arduino-processor-external-pc/).

If you wish to program the Arduino-compatible side of UDOO DUAL/QUAD from your Pc, Mac or Linux computer, <!--more-->

just follow these easy steps to get started.
First of all, check that these requirements are met:
<ul>
	<li>A working SD Card should be present on UDOO DUAL/QUAD</li>
	<li>J18 jumper should be unplugged. This will allow the communication between your computer and the programming port of the SAM3X
<img class="alignnone size-large wp-image-2533" src="http://www.udoo.org/wp-content/uploads/2013/10/boardJ18-03.png" alt="boardJ18-03.png" width="300" height="187" /></li>
	<li>The Micro USB cable should be plugged in the Sam3x port, not the one you would normally use for serial USB connection
<img class="alignnone size-large wp-image-2533" src="http://www.udoo.org/wp-content/uploads/2013/10/board_usb2-01.jpg" alt="board_usb-01" width="300" height="187" /></li>
</ul>
If all the requirements above are met, you’re ready to start. What we will basically do is configure the standard Arduino-IDE in order to make it communicate to the Sam3x of UDOO DUAL/QUAD, which is the Arduino-compatible micro-controller.

To do so:
<ul>
	<li>Download and install the Arduino IDE version 1.5 for your specific operating system from the official website (other versions will not work, since UDOO DUAL/QUAD needs Arduino 2 compabile programming software)</li>
	<li>Download the patch for your Operating system <a href="http://udoo.org/other-resources/#driverandtools">here</a></li>
	<li>Extract the files in the archive and place them in the following paths, overwriting the previous existing files:
In Windows 32 bit:
<em>C:\Program Files\Arduino\hardware\tools</em>
In Win 64 bit:
<em>C:\Program Files (x86)\Arduino\hardware\tools</em>
In Linux:
<em>/hardware/tools/</em>
In Mac OS X:
<em>/Contents/Resources/Java/hardware/tools/</em></li>
	<li>With this patch you are now able to upload your sketch selecting the Arduino Due(Programming Port) from:
<em>Tools -&gt; Board and the right port from Tools -&gt; Port in the Arduino IDE</em></li>
</ul>
&nbsp;