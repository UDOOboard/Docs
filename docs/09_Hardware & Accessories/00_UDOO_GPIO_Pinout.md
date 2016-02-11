
## Introduction

In this chapter it will be described how UDOO DUAL/QUAD manages the signals available on external pin header, and the way to control all the GPIOs. On UDOO DUAL/QUAD, Freescale i.MX and Atmel SAM3X8E share most of the GPIOs available on external pin headers. Each pin of both processors can be set in INPUT or OUTPUT mode. In INPUT mode, each processor read the electrical level of the signal. In OUTPUT mode they can drive low or high the voltage level on each pin. So both processors can control all digital external pins. Usually, with Arduino Due, applications that manage external pins are developed to run on the SAM3x8E microcontroller. On UDOO DUAL/QUAD it is possible to control external pins also using i.MX6 processor.

<br />

<img src="/docs/img/Udoo_imx6_sam3x.jpg" class="img-responsive pull-right" alt="udoo"  height="189px" width="600px" style="margin-bottom:20px; margin-left:30px;">


## UDOO DUAL/QUAD GPIO Pinout Diagram

<br />

<img src="/docs/img/Udoo_pinoutext.jpg" class="img-responsive pull-right" alt="udoo"  style="margin-bottom:20px; margin-left:30px;">


## SAM3x8E GPI/Os management

SAM3x8E microcontroller can manage GPIOs using classic Arduino programming language. To manage a GPIO in Arduino Environment it is necessary to set its direction (input or output) by calling the pinMode(pin, mode) function.

```bash

pinMode(2, INPUT ); 
pinMode(2, OUTPUT );

```

If pin is set in input mode, its value can be read by using the function digitalRead(pin) providing pin number as parameter: e.g. int val = digitalRead(2); If pin is set in output mode, its value can be written by using the function digitalWrite(pin, value)providing the pin number and the value that must be written as parameters:

```bash

digitalWrite (2, HIGH); 
digitalWrite (2, LOW);

```

More information about Arduino programming Language can be found at [Arduino Language Reference Page](http://arduino.cc/en/Reference/HomePage)

##i.MX6 GPI/O Management

i.MX6 can handle external pins in many different ways. In default configuration, they can be accessed from user level through the standard Kernel Linux interface. Some of them can be configured for specific functionalities provided by i.MX6 architecture, likespi, i2c, i2s, audiomux, pwms output, UARTs and so on. In next sections it will be described the way to use such functionalities. When a pin is set as a GPIO, it is possible to read its value, change its direction or change output value directly from console. All available GPIOs are managed by the kernel, and it is possible to access them simply by reading or writing value in specific files placed in a specific folder. In the /sys/class/gpio/ folder there are other sub-folders, one for each manageableGPIO. Each sub-folder contains files that indicate:

* direction (in / out)
* value (0 / 1)

To read a GPIO direction:

```bash

cat /sys/class/gpio/gpioXX/direction

```

In or Out output is now expected To change the pin direction:

```bash

echo out > /sys/class/gpio/gpioXX/direction

```

or

```bash

echo in > /sys/class/gpio/gpioXX/direction

```

It is possible to do the same for values read or written on the pin. To read a pin (the value read will be correct only if pin’ s direction is set as input):

```bash

cat /sys/class/gpio/gpioXX/value

```

0 or 1 output is expected To write a value on a pin:

```bash

echo 0 > /sys/class/gpio/gpioXX/value

```

or

```bash

echo 1 > /sys/class/gpio/gpioXX/value

```

## GPIOs Warnings

When changing i.MX6 GPIOs directions, it is necessary to pay special attention. New direction must be compatible with SAM3x8E pinout configuration and/or with the load of the physical pin.

* A:GPIOs can be used to build a communication channel between the two processors. By setting one processor in INPUT mode, and the other in OUTPUT mode, a one-way channel will be created. Via software, it is possible to switch the direction on both processors, in order to create a half-duplex communication channel.
* B:Two processors simultaneously can read data from external devices. They can also write data to external devices or the other processor, but only one at a time can be set in output mode.
* C:The situations here illustrated must be avoided. In the first case, both processors set the shared pin in output mode. If they try to drive the shared line with different signal values, the resulting signal level will be unpredictable

and it could result in damaging the processor driving the signal LOW. The same situation occurs when one external device tries to drive the shared line.


<img src="/docs/img/UDOO_GPIO_Warnings.jpg" class="img-responsive pull-right" alt="udoo" style="margin-bottom:20px; margin-left:30px;">

**WARNING!** There isn’ t any automatic tool that can avoid dangerous situations. The programmer must develop Hardware and Software able to avoid the occurrence of dangerous situations.

**WARNING 2!** UDOO DUAL/QUAD I/O pins are 3.3V only compliant. Providing shields with higher voltage, like 5V, could damage the board. Use only shields Arduino DUE compatible (3.3V).

##i.MX6 Pinmuxing

i.MX6 processor provides a dedicated controller for pin-muxing options, named IOMUX Controller(IOMUXC). The IOMUX Controller allows to the IC to share one pad between several functional blocks. The sharing is done by multiplexing the pad input/output signals. Every module requires a specific pad setting (such as pull up, keeper, and so on), and for each signal, there are up to 8 muxing options (called ALT modes). The pad settings parameters are controlled by the IOMUXC. In the Linux kernel, it is necessary to define a specific file for each platform.

For UDOO DUAL/QUAD, it can be found in:

```bash

<KERNEL_ROOT>/arch/arm/mach_mx6/board_mx6_seco_UDOO.c

```

This file contains specific drivers initializations, like ethernet, hdmi, sd, and so on. At the beginningof the function __init mx6_seco_UDOO_board_init(void), there is the following code:

```bash

if (cpu_is_mx6q () ) {
mxc_iomux_v3_setup_multiple_pads (mx6qd_seco_UDOO_pads,
ARRAY_SIZE (mx6qd_seco_UDOO_pads) );
printk ( "\n>UDOO quad" ) ;
}
else if ( cpu_is_mx6dl () ) {
mxc_iomux_v3_setup_multiple_pads (mx6sdl_seco_UDOO_pads,
ARRAY_SIZE (mx6sdl_seco_UDOO_pads) );
printk ( "\n>UDOO dual " ) ;
}

```

It recognizes the UDOO DUAL/QUAD version used, and load the necessary macros needed for it. mx6qd_seco_UDOO_pads and mx6sdl_seco_UDOO_pads are two array of macros defined in two header files, one for each processor type. Both .h files are included in the .c file.

```bash

<KERNEL_ROOT>/arch/arm/mach_mx6/board_mx6qd_seco_UDOO.h (QUAD)
<KERNEL_ROOT>/arch/arm/mach_mx6/board_mx6sdl_seco_UDOO.h (DUAL)

```

mxc_iomux_v3_setup_multiple_pads reads the macros and set the correct bits values in registers. Each header file defines:

* custom macros for some pins
* GPIOs id number (i.MX6 pins are divided in banks and identified by id. To make them visible by the OS it is necessary to give them a single id number.

IMX_GIPO_NR provide this function).

* macro’ s array used for pinmuxing
* an array containing the pins set as GPIOs that must be configured in output mode with high value

an array containing the pins set as GPIOs that must be configured in output mode with low value

* an array containing the pins set as GPIOs that must be configured as inputs

It is also possible to divide the pins in two sets:

* internal pins, used for communications between processors, to enable or disable external peripherals (ethernet, usb hub, audio... )
* external pins, accessible from external through the Arduino Due compatible pin headers

External pins are set in input mode, in order to prevent problems with SAM3x8Esignals. To set directions and output value for the pins defined previously as GPIOs, it is necessary to place the GPIOs macors defined in header file’ s beginning (eg. MX6DL_PAD_SD2_DAT0__GPIO_MODE) into the arrays named:

* mx6dl_set_in_outputmode_low[]
* mx6dl_set_in_outputmode_high[]
* mx6dl_set_in_inputmode[]

respectively.


## Extra functions available on UDOO DUAL/QUAD pin headers

UDOO DUAL/QUAD can provide for extra features on external pin headers. To enable them it is necessary to declare the correct alternative pin function in the platform file.These functions are:

* UARTs: uart1, uart3, uart4, uart5
* sd1
* SPIs: spi1, spi2, spi5
* i2c1
* SPDIF
* timer capture
* timer compare
* WATCHDOG FUNCTIONALITIES: watchdog reset, watchdog out
* clock out
* PWMs: pwm1, pwm2, pwm3, pwm4
* I2s Digital Audio

<img src="/docs/img/UDOO_GPIO_Extra.jpg" class="img-responsive pull-right" alt="udoo" style="margin-bottom:20px; margin-left:30px;">

On the vertical axis there are iMx6s functionalities. On the horizontal axis are shown the pins used to implements each functionality. Be careful that some pins are used for different functionalities and only one at a time can be active for each of them.

## Example

As an example, consider the possibility of enabling another serial port (UART3) connected to imx6 through external Pins. For this, it is necessary to edit the file board-mx6qd_seco_UDOO.h.Looking at the previous graph, it is possible to see that needed pins areEIM_D24 and EIM_D25. Now it is possible to select the correct macros to enable this functionality. It is also necessary to remove the related GPIOs macro from the mx6q_set_in_inputmode[] array, which contains the list of the pins configured as input GPIOs.

Once all needed changes to configuration files have been made, it is necessary to compile again the kernel source. WARNING: the pins EIM_D24 and EIM_D25 are shared with SAM3x8E .

```bash

EIM_D24 -> digital pin 53
EIM_D25 -> digital pn 47
void setup ( ) {
Serial.begin(115200) ;
pinMode(47 , INPUT ) ;
pinMode(53 , INPUT ) ;
}
void loop ( ) {
// ... some stuff ...
}

```


