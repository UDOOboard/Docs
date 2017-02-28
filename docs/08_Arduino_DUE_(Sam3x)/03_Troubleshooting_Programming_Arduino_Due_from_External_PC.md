### Using Arduino IDE from an external PC without UDOO DUAL/QUAD Board Manager package

<span class="label label-warning">Heads up!</span> This procedure could be useful if you need to check if the Arduino processor works properly, for example if you have issues with the standard procedure descripted in the previous section, or if you don't have the possibility to install the Board Manager package.

A different way for programming the Arduino side without install board manager package or patches consists in stopping the board at U-boot stage before the Kernel is loaded

To do so you’ll have to:

* Access to the debug serial monitor of the board following the [Connecting Via Serial Cable](http://www.udoo.org/do!Basic_Setup/Connecting_Via_Serial_Cable) section.

Then insert the power plug and start the system. On the serial monitor it will appear something similar:

```bash

U-Boot 2015.10-00061-g68849f9 (Jan 08 2016 - 17:01:43 +0100)                    

CPU:   Freescale i.MX6Q rev1.2 at 792 MHz                                       
Reset cause: POR                                                                
Board: UDOO Quad                                                                
DRAM:  1 GiB                                                                    
MMC:   FSL_SDHC: 0                                                              
*** Warning - bad CRC, using default environment                                

auto-detected panel HDMI                                                        
Display: HDMI (1024x768)                                                        
In:    serial                                                                   
Out:   serial                                                                   
Err:   serial                                                                   
Net:   using phy at 6                                                           
FEC [PRIME]  
Hit any key to stop autoboot:  3
Hit any key to stop autoboot:  2
Hit any key to stop autoboot:  1
Hit any key to stop autoboot:  0

```

* Before the counter reaches 0, press any key on the external PC’s serial console.

```bash

=>

```

* Close the serial monitor (without unplugging the serial cable) and unplug J18 jumper. This will allow the communication with the programming port of SAM3X;

* Plug the jumper `J22` for 1 second, then remove it (to erase the old sketch programmed in SAM3X);

* Plug the jumper `J16` for 1 second, then remove it (to reset the SAM3X);

* Open the Arduino IDE.

* Select from the IDE: Tools –> Board –> `UDOO QUAD/DUAL (Arduino Due)`

* Select from the IDE: Tools –> Port –> the right port of the UDOO QUAD/DUAL Arduino Due

* Send the sketch using the IDE upload button.

* Press the reset button to restart i.MX6 and use Ubuntu or Android again.
