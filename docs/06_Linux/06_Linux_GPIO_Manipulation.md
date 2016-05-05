## Overview

Visit our Tutorials section to learn more about: [Linux GPIO Manipulation](/tutorial/linux-gpio-manipulation/).

Driving GPIOs pin can be the very first start of every project you may imagine. <!--more-->As other boards, UDOO DUAL/QUAD has this capability. In this tutorial we are going to learn how to manipulate GPIOs from Linux on the i.MX6 side of UDOO DUAL/QUAD.
i.MX6 can handle external pins in many different ways. In default configuration, they can be accessed from user level through the standard Kernel Linux interface.

Some of them can be also configured for specific functionalities provided by i.MX6 architecture, like spi, i2c, i2s, audiomux, pwms output, UARTs and so on.
Let’s start!

When a pin is set as a GPIO, it is possible to read its value, change its direction or change output value directly from console. All available GPIOs are managed by the kernel, and it is possible to access them simply by reading or writing value in specific files placed in <em>/sys/class/gpio</em>.

The naming of GPIO is different from the naming printed on your board, which refers to Arduino naming. There’s an handy table to help you sort out the correct GPIO numbers:
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

To make your life even simplier, you can find <a href="http://www.udoo.org/labels-for-pinout-headers/">here</a> a super handy printable label for your GPIOs (thanks <em>ralphie79</em>!).

In the /sys/class/gpio/ folder there are other sub-folders, one for each manageable GPIO. Each sub-folder contains files that indicate: 

<ul>
	<li><strong>direction (in/out)</strong> 
The direction indicates wheter the PIN is listening, in, or ready to send an output.</li>
        <li><strong>value (0/1)</strong>
The value, is just like a state. Where 0 means low, and 1 means high.</li>
</ul>

To read a GPIO direction: 

```bash

cat /sys/class/gpio/gpioXX/direction

```

which will print the state direction (in or out)
 
To change the pin direction: 

```bash

echo out > /sys/class/gpio/gpioXX/direction

```

or 

```bash

echo in > /sys/class/gpio/gpioXX/direction

```

It is possible to do the same for values read or written on the pin. 
To read a pin(the pin’s direction must be set as input): 
 
```bash

cat /sys/class/gpio/gpioXX/value

```
 
0 or 1 output is expected 
 
To write a value on a pin: 
 
```bash

echo 0 > /sys/class/gpio/gpioXX/value

```

or 

```bash

echo 1 > /sys/class/gpio/gpioXX/value

```

<h2>WARNING!</h2>
When changing i.MX6 GPIOs directions, it is necessary to pay special attention. New 
direction must be compatible with SAM3x8E pinout configuration and/or with the 
load of the physical pin.

For example, setting the basic LED hello world, aka turning on a LED will be:

* Connect the LED, as for example we connect the anode to pin 8, and GND to GND

* Pin 8 correspond to gpio21

* Set pin direction to out

```bash

echo out > /sys/class/gpio/gpio21/direction

```
             
* Finally, set pin state to 1 (HIGH)

```bash

echo 1 > /sys/class/gpio/gpio21/value

```
             
* LED turns on!


And that’s it. But this is really the top of the Iceberg when it comes to interact with pins on UDOO DUAL/QUAD. To do things really seriously, and fully unleash UDOO DUAL/QUAD capabilities, take a look at <a href="http://www.udoo.org/ProjectsAndTutorials/interaction-between-linux-and-arduino-on-udoo">this tutorial on how to use both i.MX6 and SAM3x, and make them communicate</a>. 

Only then, UDOO DUAL/QUAD will really make everything possible.