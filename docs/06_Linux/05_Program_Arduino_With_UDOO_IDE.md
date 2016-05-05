## Overview

Visit our Tutorials section to learn more about: [Program Arduino With UDOO's IDE](/tutorial/program-arduino-udoos-ide/).

In this tutorial you’re going to learn how to write, upload and execute your first Arduino-compatible sketch on UDOO DUAL/QUAD.

In nerd’s jargon this is usually referred as “Hello World”, aka the first basic command you give to a device. Our “Hello World” will be a blinking led, simple as it sounds. So, let’s get our hands dirt.

First of all, we are going to connect our LED (<a href="http://en.wikipedia.org/wiki/Light-emitting_diode">http://en.wikipedia.org/wiki/Light-emitting_diode</a>) to the right GPIO on UDOO DUAL/QUAD. LEDs usually have a longer pin, which is the anode (<a href="http://en.wikipedia.org/wiki/Anode">http://en.wikipedia.org/wiki/Anode</a>) or positive, and a shorter one, which should be connected to ground. So, connect the anode of the LED to GPIO 13 and the cathode to GND, which is ground.

Once you did that, we’re ready to start programming our Hello World.

You have 2 ways of programming UDOO DUAL/QUAD’s Arduino-compatible microcontroller:
<ul>
	<li>Programming from UDOO DUAL/QUAD itself (Using Ubuntu and Arduino Ide)</li>
	<li>Programming from your PC, using a patched Arduino IDE</li>
</ul>
&nbsp;

On this tutorial we will cover only the programming via UDOO DUAL/QUAD’s Operating system, but the actual code is identical in the other scenario.

Ok, now turn on UDOO DUAL/QUAD. When Ubuntu desktop appears:

&nbsp;

* Open the Arduino IDE, you can find it on UDOO DUAL/QUAD’s Ubuntu Desktop

* Once it’s open, you’ll see some lines of code. They contain 2 parts that are needed in every Arduino sketch:
	

```bash

void setup()

```

<em>This comes at the beginning, insert here environment values</em>

```bash

void loop()

```

<em>Here you put your main code, to be executed repeatedly. The code must be contained between {}</em>

* Ok, let's insert the proper code:

First we're gonna name our GPIO pin, that is purely for future convenience. Since we got our LED connected to GPIO 13, we call pin 13 led

```bash

int led = 13;

```

then we configure our GPIO as an output

```bash

void setup() {

pinMode(led, OUTPUT);}

```

Ok, now the real code!

Let’s turn on the LED, to do so we set the pin led to HIGH state:

```bash

digitalWrite(led, HIGH);

void loop() {
digitalWrite(led, HIGH);   }

```

The complete sketch will look like this:

```bash

int led = 13;
void setup() {
pinMode(led, OUTPUT);}
void loop() {
digitalWrite(led, HIGH);   }

```


&nbsp;

To execute this command, let’s upload this to the Sam3X, to do so:
<ul>
	<li>It’s a good practice to give your code a second look, just to spot some typos or logic errors;</li>
	<li>When you’re sure everything is fine, click on Verify. This will check your code, or Sketch, for errors;</li>
	<li>If everything is fine, cross your fingers and hit upload;</li>
	<li>After few seconds, when your code has done being loaded into the Sam3X Arduino-Compatible controller, magic will happen. The LED will lit!</li>
</ul>
&nbsp;

Ok, now that you’re initiated to Pin state mode, let’s push things forward.

To turn it off, just set his value to off:

```bash

digitalWrite(led, LOW);

```

The complete sketch will look like this:

```bash

int led = 13;
void setup() {
pinMode(led, OUTPUT);}
void loop() {
digitalWrite(led, LOW);   }

```

Ok, now we know how to turn the LED on and off. What about using these 2 states combined to have a blinking LED? The logic behind this is that we turn the state HIGH, then we keep this state for some time and then we set it to LOW, keep this some time again and restart. To ensure that our led blinks and doesn’t just lit on and off, we set these logical states into a loop, that will repeat these actions forever (or, until we stop it).

```bash

void loop() {
digitalWrite(led, HIGH);   
Turn the LED on
delay(1000);    
And after a second
digitalWrite(led, LOW);   
The led is turned off
delay(1000);        }

```

Then wait another second, and restart the loop, so the LED will turn on again.

<h3>Our final sketch</h3>

```bash

int led = 13;
void setup() {
pinMode(led, OUTPUT);}
void loop() {
digitalWrite(led, HIGH);   
delay(1000);    
digitalWrite(led, LOW);  
delay(1000);      
}

```

Verify and upload this sketch to Sam3X as you did before and enjoy your blinking LED. Want to get your hands even dirtier? Our next tutorials are just awaiting for you!
