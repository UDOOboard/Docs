
If you can't see anything from your HDMI monitor be sure to follow the [why my udoo wont boot](!Troubleshooting/Why_My_UDOO_Wont_Boot) guide and have a serial debug connection first.

If the Serial returns the following output:

<img src="http://www.udoo.org/wp-content/uploads/2013/10/screenshot-hdmi-error.jpg" alt="screenshot hdmi error" width="500" height="261" class="alignnone size-full wp-image-2436" />

Reboot the board and stop the process at U-Boot stage (hit any key to stop autoboot during countdown). For more info see the <a title="UDOO Starting Manual" href="http://udoo.org/download/files/Documents/UDOO_Starting_Manual_beta0.4_11_28_2013.pdf" target="_blank">UDOO DUAL/QUAD starting manual</a>.

To apply the HDMI detect patch you have to execute the following commands:

```bash

setenv hdmi_patch udoo_hdmi_force_hpdetect

saveenv
boot

```


this command will reboot the system and, after about 30 seconds, the HDMI monitor should start.
If you're able to see the output on your monitor the UDOO DUAL/QUAD is correctly patched.

If not, run this command:

```bash

dmesg | grep edid

```

if you get the following output

```bash

mxc_hdmi mxc_hdmi: No nodes read from edid

```

there is a problem in reading the EDID code from HDMI monitor.

Reboot the board again and stop the process at U-Boot stage (hit any key to stop autoboot during countdown). For more info see the <a title="UDOO Starting Manual" href="http://udoo.org/download/files/Documents/UDOO_Starting_Manual_beta_0.3_10_10_2013.pdf" target="_blank">UDOO DUAL/QUAD starting manual</a>.
Run these commands:

```bash

setenv hdmi_patch udoo_hdmi_force_hpdetect udoo_hdmi_force_edid

saveenv
boot

```

Once the system finished booting, run:

```bash

sudo i2cdump -f -y 1 0x50

```

That command should dump edid table readed from HDMI display

```bash

No size specified (using byte-data access)
   0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f	0123456789abcdef
00: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
10: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
80: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
90: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
a0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
b0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
c0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
d0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
e0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX
f0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX	XXXXXXXXXXXXXXXX

```

This means that the kernel is unable to read the correct information to fit your screen resolution.
To do so, you need to find the correct edid.txt file in a different way.

Here's an example of a valid edid table to write inside the /etc/edid.txt file

```bash

00 ff ff ff ff ff ff 00 26 cd 0c 56 6f 1e 00 00
2b 15 01 03 80 34 1d 78 2a 60 41 a6 56 4a 9c 25
12 50 54 bf ef 00 71 4f 81 40 81 80 95 00 95 0f
b3 00 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
45 00 09 25 21 00 00 1e 00 00 00 fd 00 38 4c 1e
53 11 00 0a 20 20 20 20 20 20 00 00 00 fc 00 50
4c 32 34 30 39 48 44 0a 20 20 20 20 00 00 00 ff
00 31 31 30 37 37 4d 31 41 30 37 37 39 31 01 be
02 03 1f f1 4c 01 02 03 04 05 10 11 12 13 14 1e
1f 23 09 07 01 83 01 00 00 65 03 0c 00 10 00 8c
0a d0 8a 20 e0 2d 10 10 3e 96 00 09 25 21 00 00
18 01 1d 00 72 51 d0 1e 20 6e 28 55 00 09 25 21
00 00 1e 8c 0a d0 90 20 40 31 20 0c 40 55 00 09
25 21 00 00 18 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f

```


By default the patch loads an edid.txt file that should work with 1920x1080 resolution.
For different screen resolutions you should retrive the edid.txt file in a different way and then copy it to /etc/edid.txt (we are still looking for the right procedure to retrieve your edid configuration).

At <a href="http://en.wikipedia.org/wiki/Extended_display_identification_data" title="edid" target="_blank">this url</a> you'll find more information about the edid files.

