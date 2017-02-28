If your UDOO DUAL/QUAD doesn't boot, you first need to:


* Wait at least 2 minutes: right now there is no feedback during the boot process, only a black screen;
* Check the MicroSD Card and try to reflash it with a proper version, or use a different OS;
* Try with a new MicroSD Card: the one you were using could be corrupted and cannot be restored to proper functionality;
* Check if you are using the proper power supply and if it provides the right voltage and amperage. To do so, check with a multimeter if the output voltage sits between 6 and 15V and at least 1A;
* After plugging the PSU cable, try to hit the reset button.


If the board still doesn't boot you need to verify if your OS actually starts using a serial debug connection. This allows a more complete analysis of your situation. To establish a USB Debug connection follow these <a href="/do!Basic_Setup/Connecting_Via_Serial_Cable">easy steps on our Docs</a>.

Once you're ready, power up your UDOO DUAL/QUAD and look at the serial output:



1- If the Serial returns the following output (after 30 seconds)

<img class="alignnone size-full wp-image-2438" alt="screenshot ok login" src="http://www.udoo.org/wp-content/uploads/2013/10/screenshot-ok-login.jpg" width="550" height="290" />

the OS was correctly loaded by UDOO DUAL/QUAD. Everything works just fine, the problem could be in the HDMI cable, in your display or your UDOO DUAL/QUAD probably needs a patch that will solve a HDMI problem we encountered in some UDOO DUAL/QUAD. The patch will be available soon.



2- If the Serial returns the following output or similar:

<img class="alignnone size-full wp-image-2437" alt="screenshot kernel error" src="http://www.udoo.org/wp-content/uploads/2013/10/screenshot-kernel-error.jpg" width="550" height="323" />

The OS is corrupted which means and error occurred during the download or the flashing process of the image. In this case verify the validity of the image using the related SHA1 you can find in the download section of <a title="udoo" href="http://www.udoo.org/downloads/" target="_blank">www.udoo.org</a> and try to <a title="Write the image on MicroSD" href="/docs/Getting_Started/Create_A_Bootable_MicroSD_card_for_UDOO" target="_blank">rewrite the image on your MicroSD</a>.



3- If the Serial returns the following output:

<img class="alignnone size-full wp-image-2436" alt="screenshot hdmi error" src="http://www.udoo.org/wp-content/uploads/2013/10/screenshot-hdmi-error.jpg" width="550" height="287" />

You may experiencing a HDMI issues. To solve the problem, check the troubleshooting guide: <a title="HDMI patch" href="/docs/Troubleshooting/How_Can_I_Solve_My_HDMI_Issues" target="_blank">How can I solve my HDMI issues?</a> Don't forget however to check your HDMI cable connection, maybe something wasn't plugged properly.



4- If the Serial returns nothing:

The image wasn't correctly flashed (e.g. was written in a partition) or you selected a wrong image in the download section (e.g. a Ubuntu_dual for a UDOO Quad). In this case repeat the procedure of <a title="Write the image on MircoSD" href="/docs/Getting_Started/Create_A_Bootable_MicroSD_card_for_UDOO" target="_blank">how to write the image on MicroSD</a>.
