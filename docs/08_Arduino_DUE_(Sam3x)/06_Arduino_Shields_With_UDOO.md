## Overview

Visit our Tutorials section to learn more about: [Arduino Shields With UDOO](https://www.udoo.org/tutorial/arduino-shields-udoo/).

Learn how to use Arduino Shields with UDOO DUAL/QUAD. We'll also give you some guidelines on how to understand if your Shields are compatible straight away or if they need some fixes to be used safely with UDOO DUAL/QUAD.
As you may know, the Arduino controller on UDOO DUAL/QUAD is <a title="SAM3X" href="http://www.atmel.com/images/doc11057s.pdf">Atmel SAM3X</a>, which is the exact same you'll find on Arduino DUE. You may also be aware that there is a fundamental difference beetween Arduino UNO and DUE: UNO's voltage is 5V and DUE's is 3,3V. That means that the voltage carried in and out digital and analog pins differ significantly among the two board versions, and feeding right away a circuit designed to operate at 3,3V with 5V is not a good idea.
This is the only relevant difference: pin configuration and layout is the same among the two revision.

To know if your Arduino shield can be used safely with UDOO DUAL/QUAD, the first thing is to find out if it works at 5V or 3,3 V. You can understand by looking at the datasheets, instructions, or asking google. If your Shield runs at 3,3V, you're good to go. No problems, just snap it on UDOO DUAL/QUAD and enjoy.

If instead your shield runs at 5V, then you need to know if this voltage will be fed back into UDOO DUAL/QUAD's SAM3X: this happens mostly with sensors and shields which need to exchange data with Arduino. If your shield is just receiving data, and not sending back to UDOO DUAL/QUAD, again, you're good to go. You may just need to adjust your Arduino Sketch in order to fit the scale to 3,3, but this is a simple fix.

And now, let's face the worst  case scenario: your shield works at 5V and will send data back to UDOO DUAL/QUAD. Be aware that using the shield directly with UDOO DUAL/QUAD will probably damage the SAM3X Arduino processor. But that doesn't mean you can't use it.
By applying 2 resistors (one 10KOhm and 20KOhm) as the following schematic explain, will reduce the voltage to 3,3V, allowing you to use it with UDOO DUAL/QUAD. Again, you may need to change your Sketch to match a 3,3 scale, instead of 5v.

<img class="aligncenter size-large wp-image-3650" alt="UDOO_Arduino_UNO_Shields" src="https://www.udoo.org/wp-content/uploads/2014/04/UDOO_Arduino_UNO_Shields-1024x878.jpg" width="500" height="478" />

To help you out on this task, we've set up a <a href="https://www.youtube.com/watch?v=cEwem_8Apvc&amp;feature=youtu.be">brief Video</a> which will guide you through this operation, and to further assist your making sessions, we've set up a <a title="Arduino Shields compatibility UDOO" href="https://www.udoo.org/forum/arduino-shields-compatibility-list-share-your-experiences-t1353.html">specific thread</a>, listing Arduino Shields which are known to be working. Feel free to share your experience there!