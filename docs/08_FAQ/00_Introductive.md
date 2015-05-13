
## What is a single board computer?

A single-board computer (SBC) like UDOO or Raspberry Pi is a complete computer built on a single circuit board, with microprocessor(s), memory, input/output (I/O) and other features of a functional computer. 


## Which people use single board computers like UDOO?

Students and teachers, designers, startups, industries, research groups: all of them are average users of single board computers like UDOO. 

They are called <a href="https://en.wikipedia.org/wiki/Maker_culture" target="_blank">Makers</a>.

You can be a Maker too.
Everybody can be a Maker.


## Why people use single board computers like UDOO?

People use UDOO for three purposes:
a) like a pocket low-cost low-power consumption computer;
b) like an Arduino;
c) like a computer designed to be embedded on things, ideal for <a href="udoo.hackster.io" target="_blank">creative projects</a>. 


## Why should I use a single board computer instead of a laptop computer?

They are two different things.
Single board computers are perfect to be embedded on things and devices, like a piece of puzzle.
If you want to build a <a href="http://udoo.hackster.io/mikelangeloz/carmadillo-android-controlled-udoo-rover" target="_blank">rover</a>, a <a href="http://udoo.hackster.io/patrick-bronneberg/udoo-dslr-photobooth" target="_blank">Photobooth</a> or you just want to <a href="http://udoo.hackster.io/oskar/x-ems" target="_blank">hack your car</a>, you can't do it with your computer: it's too big, too heavy, too high power-consumption, and lack GPIOs.  


## What is a microcontroller?
A microcontroller is a small computer, designed for specificied and/or light tasks, built on a single integrated circuit containing a processor core, memory, and programmable input/output peripherals.

The most famous microcontroller is <a href="www.arduino.cc" target="_blank">Arduino</a>, the pioneer of the Maker movement.


## What is Arduino?

<a href="www.arduino.cc" target="_blank">Arduino</a> is an open-source microcontroller.

Arduino is so great because with Arduino you can tinker and realize cool stuff without being an engineers.
Arduino is a powerful tool, and that's why we designed UDOO to be Arduino-compatible.


## What is a jumper?
A jumper is a short length of conductor used to close a break in or open, or bypass part of, an electrical circuit. On UDOO jumpers are signed.  


## Which are the jumpers of UDOO and what should I use them for?
Jumpers of UDOO are: J2, J16, J18, J22.
Every jumper has a different purpose. 
If you keep J18 plugged, you are talking with the i.MX 6 processor and, for example, you can see the console during the boot and talk with the u-boot, stopping it, for example. If you unplug J18, you instead talk with SAM3X8E.
By plugging and unplugging J22 you can erase the Arduino sketch you have written: it means you have to reflash your MicroSD.
By plugging and unplugging J16, you reset the Arduino: it means your sketch will restart from setup 
J2 enables OTG power supply. Keep it plugged to enable the power supply on the OTG port. 


## What is a serial?
You will read many times about "serials" in the Forum. "Serial" stands for "serial cable": a cable used to transform the information between two devices using a serial communication protocol.




