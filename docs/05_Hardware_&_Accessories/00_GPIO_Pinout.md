
## Introduction

In this chapter it will be described how UDOO DUAL/QUAD manages the signals available on external pin header, and the way to control all the GPIOs. On UDOO DUAL/QUAD, Freescale i.MX and Atmel SAM3X8E share most of the GPIOs available on external pin headers. Each pin of both processors can be set in INPUT or OUTPUT mode. In INPUT mode, each processor read the electrical level of the signal. In OUTPUT mode they can drive low or high the voltage level on each pin. So both processors can control all digital external pins. Usually, with Arduino Due, applications that manage external pins are developed to run on the SAM3x8E microcontroller. On UDOO DUAL/QUAD it is possible to control external pins also using i.MX6 processor.

<br />

<img src="../img/Udoo_imx6_sam3x.jpg" class="img-responsive pull-right" alt="udoo"  height="189px" width="600px" style="margin-bottom:20px; margin-left:30px;">


## UDOO DUAL/QUAD GPIO Pinout Diagram

<br />

<a href="../img/Udoo_pinoutext.jpg" target="_blank"><img style="width:400px; " src="../img/Udoo_pinoutext.jpg"></a>

<br />

## Arduino DUE (SAM3x8E) GPI/Os Management

SAM3x8E microcontroller can manage GPIOs using classic Arduino programming language. To manage a GPIO in Arduino Environment it is necessary to set its direction (input or output) by calling the pinMode(pin, mode) function.

```bash

pinMode(2, INPUT );
pinMode(2, OUTPUT );

```

If pin is set in input mode, its value can be read by using the function digitalRead(pin) providing pin number as parameter: e.g. int val = digitalRead(2); If pin is set in output mode, its value can be written by using the function digitalWrite(pin, value)providing the pin number and the value that must be written as parameters:

```bash

digitalWrite(2, HIGH);
digitalWrite(2, LOW);

```

More information about Arduino programming Language can be found at [Arduino Language Reference Page](http://arduino.cc/en/Reference/HomePage)

Go to the Arduino section to learn how to program the Arduino DUE embedded

## Linux (i.MX6) GPI/Os Management

i.MX6 can handle external pins in many different ways. In default configuration, they can be accessed from user level through the standard Kernel Linux interface. Some of them can be configured for specific functionalities provided by i.MX6 architecture, like SPI, I2C, I2S, audiomux, PWMs output, UARTs and so on. Go to the [Device Tree Editor](!Cookbook_Linux/Device_Tree_Editor) section to know how export these functionalities.
<br />
By default (for safety reasons), all GPIOs are exported in *input* configuration from the Linux side, to let you use they from the Arduino DUE side. This means the board CPU can read the value of the voltage connected to the pins. The other possible configuration is *output*, which forces a pin to take a specific voltage.

<span class="label label-warning">Heads up!</span> When using the *output* configuration, be sure to avoid short-circuits!

It is possible to switch a pin in *input* or *output* mode with the following commands:

    # set pin 25 to input
    echo in > /gpio/pin25/direction

    # set pin 25 to output
    echo out > /gpio/pin25/direction

To verify the voltage direction, just read the same file:

    cat /gpio/pin25/direction


#### Write values
To write a low or high value on a GPIO, you need to write `0` or `1` in the *value* file:

    # set GPIO 25 to low value - 0 volts
    echo 0 > /gpio/pin25/value

    # set GPIO 25 to high value - 3.3 volts
    echo 1 > /gpio/pin25/value

In order to set the value, the GPIO must be in the `out` direction.


#### Read values
If the direction is set to `in`, it is possible to read the GPIO value reading the same file:

    cat /gpio/pin25/value

If the direction is set to `out` and you try to read the value, is not guaranteed that the value is coherent with the voltage found on the external pinout.

To make your life even simplier, you can find <a href="http://www.udoo.org/labels-for-pinout-headers/">a super handy printable label</a> for your GPIOs (thanks <em>ralphie79</em>!).

### Advanced usage
GPIO management is made simple by the `udoo-gpio-export` package, which comes pre-installed in UDOObuntu 2 Linux. This package takes care of exporting all GPIOs in input mode, and creates the symlinks from the `/sys/class/gpio` entries to the `/gpio` directory.

If you want, you can directly use the `/sys/class/gpio` entries. For example, to export a GPIO use:

    echo GPIO_NUMBER > /sys/class/gpio/export

Please note that `GPIO_NUMBER` is not the number written on the PCB. Instead, it is the number written in the round label close to the PCB number in the previous two images. For example, if you want to control the pin 24 (PCB name) you should read `GPIO_25`.

`GPIO_NUMBER` can be calculated with the following relation:

    GPIO_NUMBER = ((BANK - 1) * 32 ) + ID

For example, if you want to export the GPIO1_IO_25;

    # GPIO1_IO_25 means BANK=1 and ID=25
    # GPIO_NUMBER = ((1 - 1) * 32 ) + 25 = 25
    echo 25 > /sys/class/gpio/export

<br />
There’s an handy table to help you sort out the correct GPIO numbers:

<div class="table-1">
<table width="100%">
<thead>
<tr>
<th>PIN NUMBER</th>
<th>GPIO NUMBER</th>
<th>PATH</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>116</td>
<td><em>/sys/class/gpio/gpio116/</em></td>
</tr>
<tr>
<td>1</td>
<td>112</td>
<td><em>/sys/class/gpio/gpio112/</em></td>
</tr>
<tr>
<td>2</td>
<td>20</td>
<td><em>/sys/class/gpio/gpio20/</em></td>
</tr>
<tr>
<td>3</td>
<td>16</td>
<td><em>/sys/class/gpio/gpio16/</em></td>
</tr>
<tr>
<td>4</td>
<td>17</td>
<td><em>/sys/class/gpio/gpio17/</em></td>
</tr>
<tr>
<td>5</td>
<td>18</td>
<td><em>/sys/class/gpio/gpio18/</em></td>
</tr>
<tr>
<td>6</td>
<td>41</td>
<td><em>/sys/class/gpio/gpio41/</em></td>
</tr>
<tr>
<td>7</td>
<td>42</td>
<td><em>/sys/class/gpio/gpio42/</em></td>
</tr>
<tr>
<td>8</td>
<td>21</td>
<td><em>/sys/class/gpio/gpio21/</em></td>
</tr>
<tr>
<td>9</td>
<td>19</td>
<td><em>/sys/class/gpio/gpio19/</em></td>
</tr>
<tr>
<td>10</td>
<td>1</td>
<td><em>/sys/class/gpio/gpio1/</em></td>
</tr>
<tr>
<td>11</td>
<td>9</td>
<td><em>/sys/class/gpio/gpio9/</em></td>
</tr>
<tr>
<td>12</td>
<td>3</td>
<td><em>/sys/class/gpio/gpio3/</em></td>
</tr>
<tr>
<td>13</td>
<td>40</td>
<td><em>/sys/class/gpio/gpio40/</em></td>
</tr>
<tr>
<td>14</td>
<td>150</td>
<td><em>/sys/class/gpio/gpio150/</em></td>
</tr>
<tr>
<td>15</td>
<td>162</td>
<td><em>/sys/class/gpio/gpio162/</em></td>
</tr>
<tr>
<td>16</td>
<td>160</td>
<td><em>/sys/class/gpio/gpio160/</em></td>
</tr>
<tr>
<td>17</td>
<td>161</td>
<td><em>/sys/class/gpio/gpio161/</em></td>
</tr>
<tr>
<td>18</td>
<td>158</td>
<td><em>/sys/class/gpio/gpio158/</em></td>
</tr>
<tr>
<td>19</td>
<td>159</td>
<td><em>/sys/class/gpio/gpio159/</em></td>
</tr>
<tr>
<td>20</td>
<td>92</td>
<td><em>/sys/class/gpio/gpio92/</em></td>
</tr>
<tr>
<td>21</td>
<td>85</td>
<td><em>/sys/class/gpio/gpio85/</em></td>
</tr>
<tr>
<td>22</td>
<td>123</td>
<td><em>/sys/class/gpio/gpio123/</em></td>
</tr>
<tr>
<td>23</td>
<td>124</td>
<td><em>/sys/class/gpio/gpio124/</em></td>
</tr>
<tr>
<td>24</td>
<td>125</td>
<td><em>/sys/class/gpio/gpio125/</em></td>
</tr>
<tr>
<td>25</td>
<td>126</td>
<td><em>/sys/class/gpio/gpio126/</em></td>
</tr>
<tr>
<td>26</td>
<td>127</td>
<td><em>/sys/class/gpio/gpio127/</em></td>
</tr>
<tr>
<td>27</td>
<td>133</td>
<td><em>/sys/class/gpio/gpio133/</em></td>
</tr>
<tr>
<td>28</td>
<td>134</td>
<td><em>/sys/class/gpio/gpio134/</em></td>
</tr>
<tr>
<td>29</td>
<td>135</td>
<td><em>/sys/class/gpio/gpio135/</em></td>
</tr>
<tr>
<td>30</td>
<td>136</td>
<td><em>/sys/class/gpio/gpio136/</em></td>
</tr>
<tr>
<td>31</td>
<td>137</td>
<td><em>/sys/class/gpio/gpio137/</em></td>
</tr>
<tr>
<td>32</td>
<td>138</td>
<td><em>/sys/class/gpio/gpio138/</em></td>
</tr>
<tr>
<td>33</td>
<td>139</td>
<td><em>/sys/class/gpio/gpio139/</em></td>
</tr>
<tr>
<td>34</td>
<td>140</td>
<td><em>/sys/class/gpio/gpio140/</em></td>
</tr>
<tr>
<td>35</td>
<td>141</td>
<td><em>/sys/class/gpio/gpio141/</em></td>
</tr>
<tr>
<td>36</td>
<td>142</td>
<td><em>/sys/class/gpio/gpio142/</em></td>
</tr>
<tr>
<td>37</td>
<td>143</td>
<td><em>/sys/class/gpio/gpio143/</em></td>
</tr>
<tr>
<td>38</td>
<td>54</td>
<td><em>/sys/class/gpio/gpio54/</em></td>
</tr>
<tr>
<td>39</td>
<td>205</td>
<td><em>/sys/class/gpio/gpio205/</em></td>
</tr>
<tr>
<td>40</td>
<td>32</td>
<td><em>/sys/class/gpio/gpio32/</em></td>
</tr>
<tr>
<td>41</td>
<td>35</td>
<td><em>/sys/class/gpio/gpio35/</em></td>
</tr>
<tr>
<td>42</td>
<td>34</td>
<td><em>/sys/class/gpio/gpio34/</em></td>
</tr>
<tr>
<td>43</td>
<td>33</td>
<td><em>/sys/class/gpio/gpio33/</em></td>
</tr>
<tr>
<td>44</td>
<td>101</td>
<td><em>/sys/class/gpio/gpio101/</em></td>
</tr>
<tr>
<td>45</td>
<td>144</td>
<td><em>/sys/class/gpio/gpio144/</em></td>
</tr>
<tr>
<td>46</td>
<td>145</td>
<td><em>/sys/class/gpio/gpio145/</em></td>
</tr>
<tr>
<td>47</td>
<td>89</td>
<td><em>/sys/class/gpio/gpio89/</em></td>
</tr>
<tr>
<td>48</td>
<td>105</td>
<td><em>/sys/class/gpio/gpio105/</em></td>
</tr>
<tr>
<td>49</td>
<td>104</td>
<td><em>/sys/class/gpio/gpio104/</em></td>
</tr>
<tr>
<td>50</td>
<td>57</td>
<td><em>/sys/class/gpio/gpio57/</em></td>
</tr>
<tr>
<td>51</td>
<td>56</td>
<td><em>/sys/class/gpio/gpio56/</em></td>
</tr>
<tr>
<td>52</td>
<td>55</td>
<td><em>/sys/class/gpio/gpio55/</em></td>
</tr>
<tr>
<td>53</td>
<td>88</td>
<td><em>/sys/class/gpio/gpio88/</em></td>
</tr>
</tbody>
</table>
</div>



## GPIOs Warnings

When changing i.MX6 GPIOs directions, it is necessary to pay special attention. New direction must be compatible with SAM3x8E pinout configuration and/or with the load of the physical pin.

* A:GPIOs can be used to build a communication channel between the two processors. By setting one processor in INPUT mode, and the other in OUTPUT mode, a one-way channel will be created. Via software, it is possible to switch the direction on both processors, in order to create a half-duplex communication channel.
* B:Two processors simultaneously can read data from external devices. They can also write data to external devices or the other processor, but only one at a time can be set in output mode.
* C:The situations here illustrated must be avoided. In the first case, both processors set the shared pin in output mode. If they try to drive the shared line with different signal values, the resulting signal level will be unpredictable

and it could result in damaging the processor driving the signal LOW. The same situation occurs when one external device tries to drive the shared line.

<a href="../img/UDOO_GPIO_Warnings.jpg" target="_blank"><img style="width:400px; " src="../img/UDOO_GPIO_Warnings.jpg"></a>

**WARNING!** There isn’t any automatic tool that can avoid dangerous situations. The programmer must develop Hardware and Software able to avoid the occurrence of dangerous situations.

**WARNING 2!** UDOO DUAL/QUAD I/O pins are 3.3V only compliant. Providing shields with higher voltage, like 5V, could damage the board. Use only shields Arduino DUE compatible (3.3V).


## Extra functions available on UDOO DUAL/QUAD pin headers

UDOO DUAL/QUAD can provide for extra features on external pin headers. To enable them it is necessary to declare the correct alternative pin function in the device tree of the kernel.
<br />
UDOObuntu 2 provides a simple graphic tool to allow you to manage most of these functionalities: the [Device Tree Editor](!Cookbook_Linux/Device_Tree_Editor).
<br />
These functions are:

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

<a href="../img/UDOO_GPIO_Extra.jpg" target="_blank"><img style="width:400px; " src="../img/UDOO_GPIO_Extra.jpg"></a>

On the vertical axis there are iMX6s functionalities. On the horizontal axis are shown the pins used to implements each functionality. Be careful that some pins are used for different functionalities and only one at a time can be active for each of them.
