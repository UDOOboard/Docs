#####################################
GPIO manipulation from Linux
#####################################




Driving GPIOs pin can be the very first start of every project you may imagine. As other boards, UDOO has this 
capability. In this tutorial we are going to learn how to manipulate GPIOs from Linux on the i.MX6 side of UDOO.
i.MX6 can handle external pins in many different ways. In default configuration, they can be accessed from user level 
through the standard Kernel Linux interface.

Some of them can be also configured for specific functionalities provided by i.MX6 architecture, like spi, i2c, i2s, 
audiomux, pwms output, UARTs and so on.
Let’s start!

When a pin is set as a GPIO, it is possible to read its value, change its direction or change output value directly 
from console. All available GPIOs are managed by the kernel, and it is possible to access them simply by reading or 
writing value in specific files placed in /sys/class/gpio.

The naming of GPIO is different from the naming printed on your board, which refers to Arduino naming. There’s an handy
table to help you sort out the correct GPIO numbers:

PIN NUMBER	GPIO NUMBER	PATH
0	116	/sys/class/gpio/gpio116/
1	112	/sys/class/gpio/gpio112/
2	20	/sys/class/gpio/gpio20/
3	16	/sys/class/gpio/gpio16/
4	17	/sys/class/gpio/gpio17/
5	18	/sys/class/gpio/gpio18/
6	41	/sys/class/gpio/gpio41/
7	42	/sys/class/gpio/gpio42/
8	21	/sys/class/gpio/gpio21/
9	19	/sys/class/gpio/gpio19/
10	1	/sys/class/gpio/gpio1/
11	9	/sys/class/gpio/gpio9/
12	3	/sys/class/gpio/gpio3/
13	40	/sys/class/gpio/gpio40/
14	150	/sys/class/gpio/gpio150/
15	162	/sys/class/gpio/gpio162/
16	160	/sys/class/gpio/gpio160/
17	161	/sys/class/gpio/gpio161/
18	158	/sys/class/gpio/gpio158/
19	159	/sys/class/gpio/gpio159/
20	92	/sys/class/gpio/gpio92/
21	85	/sys/class/gpio/gpio85/
22	123	/sys/class/gpio/gpio123/
23	124	/sys/class/gpio/gpio124/
24	125	/sys/class/gpio/gpio125/
25	126	/sys/class/gpio/gpio126/
26	127	/sys/class/gpio/gpio127/
27	133	/sys/class/gpio/gpio133/
28	134	/sys/class/gpio/gpio134/
29	135	/sys/class/gpio/gpio135/
30	136	/sys/class/gpio/gpio136/
31	137	/sys/class/gpio/gpio137/
32	138	/sys/class/gpio/gpio138/
33	139	/sys/class/gpio/gpio139/
34	140	/sys/class/gpio/gpio140/
35	141	/sys/class/gpio/gpio141/
36	142	/sys/class/gpio/gpio142/
37	143	/sys/class/gpio/gpio143/
38	54	/sys/class/gpio/gpio54/
39	205	/sys/class/gpio/gpio205/
40	32	/sys/class/gpio/gpio32/
41	35	/sys/class/gpio/gpio35/
42	34	/sys/class/gpio/gpio34/
43	33	/sys/class/gpio/gpio33/
44	101	/sys/class/gpio/gpio101/
45	144	/sys/class/gpio/gpio144/
46	145	/sys/class/gpio/gpio145/
47	89	/sys/class/gpio/gpio89/
48	105	/sys/class/gpio/gpio105/
49	104	/sys/class/gpio/gpio104/
50	57	/sys/class/gpio/gpio57/
51	56	/sys/class/gpio/gpio56/
52	55	/sys/class/gpio/gpio55/
53	88	/sys/class/gpio/gpio88/
To make your life even simplier, you can find here a super handy printable label for your GPIOs (thanks ralphie79!).
In the /sys/class/gpio/ folder there are other sub-folders, one for each manageable GPIO. 
Each sub-folder contains files that indicate:
direction (in/out)
The direction indicates wheter the PIN is listening, in, or ready to send an output.
value (0/1)
The value, is just like a state. Where 0 means low, and 1 means high.
To read a GPIO direction:
1
cat /sys/class/gpio/gpioXX/direction
which will print the state direction (in or out)

To change the pin direction:

1
echo out > /sys/class/gpio/gpioXX/direction
or

1
echo in > /sys/class/gpio/gpioXX/direction
It is possible to do the same for values read or written on the pin.
To read a pin(the pin’s direction must be set as input):

1
cat /sys/class/gpio/gpioXX/value
0 or 1 output is expected

To write a value on a pin:

1
echo 0 > /sys/class/gpio/gpioXX/value
or

1
echo 1 > /sys/class/gpio/gpioXX/value
WARNING!

When changing i.MX6 GPIOs directions, it is necessary to pay special attention. New
direction must be compatible with SAM3x8E pinout configuration and/or with the
load of the physical pin.
For example, setting the basic LED hello world, aka turning on a LED will be:
Connect the LED, as for example we connect the anode to pin 8, and GND to GND
Pin 8 correspond to gpio21
Set pin direction to out
1
echo out > /sys/class/gpio/gpio21/direction
Finally, set pin state to 1 (HIGH)
1
echo 1 > /sys/class/gpio/gpio21/value
LED turns on!
And that’s it. But this is really the top of the Iceberg when it comes to interact with pins on UDOO. 
To do things really seriously, and fully unleash UDOO capabilities, take a look at this tutorial on how to use 
both i.MX6 and SAM3x, and make them communicate.
