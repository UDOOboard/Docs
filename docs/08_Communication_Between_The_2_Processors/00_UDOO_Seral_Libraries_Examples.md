
## Overview

Visit our Tutorials section to learn more about: [UDOO Serial Libraries Examples](/tutorial/udoo-serial-libraries-examples/).



This tutorial is meant to demonstrate how to implement a uni\bidirectional communication between an Arduino sketch (running on SAM3X Arduino Compatible processor) and a binary application on iMX6 Linux processor.

The Arduino sketch will remain the same no matter which programming language you’ll use to develop the binary on iMX6.

There are two example scripts for each programming language: C, Java, PHP, Python. You can find the whole repo in <a href="https://github.com/UDOOboard/serial_libraries_examples" title="UDOO Serial Libraries Examples Github" target="_blank">our Github Channel</a>.

Each program is meant to be executed while the matching Arduino Sketch is running on SAM3X:

<a href="https://github.com/UDOOboard/serial_libraries_examples/tree/master/Arduino/arduino_serial_example" title="arduino serial example" target="_blank">arduino_serial_example.ino</a> for the following unidirectional programs:

```bash

c_serial_example.c
java_serial_example.java
php_serial_example.php
python_serial_example.py

```

<a href="https://github.com/UDOOboard/serial_libraries_examples/tree/master/Arduino/arduino_serial_example_bidirectional" title="arduino serial example bidirectional" target="_blank">arduino_serial_example_bidirectional.ino</a> for the following bidirectional programs:

```bash

c_serial_example_bidirectional.c
java_serial_example_bidirectional.java
php_serial_example_bidirectional.php
python_serial_example_bidirectional.py

```


<h2 style="text-align: left;">C Serial Libraries for UDOO DUAL/QUAD</h2>

This part describes how to compile and run the C examples contained in <a href="https://github.com/UDOOboard/serial_libraries_examples/tree/master/c" title="C" target="_blank">this folder</a>.

1 - Open a terminal and navigate to this folder:

```bash

cd serial_libraries_examples/c/

```

2 - Compile the C file:

for c_serial_example.c:

```bash

gcc -o c_serial_example c_serial_example.c

```

for c_serial_example_bidirectional.c:

```bash

gcc -o c_serial_example_bidirectional c_serial_example_bidirectional.c

```

3 - Run the C program:

for c_serial_example.c:

```bash

./c_serial_example

```

for c_serial_example_bidirectional.c:

```bash

./c_serial_example_bidirectional

```

<h2 style="text-align: left;">JAVA Serial libraries for UDOO DUAL/QUAD</h2>
This part describes how to compile and run the Java examples contained in <a href="https://github.com/UDOOboard/serial_libraries_examples/tree/master/java" title="Java" target="_blank">this folder</a>.

1 - Install the Java library to manage the serial:
(NB: jump to the step 2 if you have this example preinstalled in you UDOObuntu distribution, release 1.1 and above)

1a. If you are in a UDOO DUAL/QUAD distribution with the Arduino IDE preinstalled(UDOObuntu 1.0, Debian Wheezy 1.1) use the library contained in the /lib folder(this recompiled library handles properly the /dev/ttymxc3 internal serial of UDOO DUAL/QUAD):

```bash

sudo cp /opt/arduino-1.5.4/lib/librxtxSerial-2.2pre1.so /usr/lib/jvm/java-7-openjdk-armhf/jre/lib/arm/
sudo cp /opt/arduino-1.5.4/lib/RXTXcomm.jar /usr/share/java/
cd /usr/lib/jvm/java-7-openjdk-armhf/jre/lib/arm/
sudo ln -s librxtxSerial-2.2pre1.so librxtxSerial.so

```

1b. If you are in other UDOO DUAL/QUAD distributions use the standard Vanilla JAVA Libraries.

Install librxtx-java from repositories

```bash

sudo apt-get install librxtx-java

```

Copy appropriate libraries and symlink them

```bash

sudo cp /usr/lib/jni/librxtxSerial-2.2pre1.so /usr/lib/jvm/java-7-openjdk-armhf/jre/lib/arm/ 
cd /usr/lib/jvm/java-7-openjdk-armhf/jre/lib/arm/
sudo ln -s librxtxSerial-2.2pre1.so librxtxSerial.so

```

Now symlink them to allow UDOO DUAL/QUAD's /dev/ttymxc3 serial port binding

```bash

sudo ln -s /dev/ttymxc3 /dev/ttyS0

```

(NB: using this library you need to modify the code of the examples substituting in both the JAVA files the String "/dev/ttymxc3" with "/dev/ttyS0".)

2 - Open a terminal and navigate to this folder:

```bash

cd serial_libraries_examples/java/

```

3 - Compile the Java file:

for Java_serial_example.java:

```bash

javac -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example.java

```

for Java_serial_example_bidirectional.java:

```bash

javac -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example_bidirectional.java

```

4 - Run the Java program:

for Java_serial_example.java:

```bash

java -Djava.library.path=/usr/lib/jni -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example

```

for Java_serial_example_bidirectional.java:

```bash

java -Djava.library.path=/usr/lib/jni -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example_bidirectional

```

<h2 style="text-align: left;">PHP Serial Libraries for UDOO DUAL/QUAD</h2>

This part describes how to run the PHP examples contained in <a href="https://github.com/UDOOboard/serial_libraries_examples/tree/master/php" title="Php" target="_blank">this folder</a>. To run this PHP examples you need a PHP interpreter and a Web Server. The easiest way is install a preconfigured LAMP environment using tasksel.

1 - In a terminal run:

```bash

sudo apt-get update
sudo apt-get install tasksel

```

2 - Install LAMP following the instruction:

```bash

sudo tasksel install lamp-server

```

3 - Grant www-data user appropriate permissions for the serial port:

```bash

sudo adduser www-data intserial

```

4 - Navigate in this folder and copy the php files in the Apache web server folder (/var/www/):

```bash

cd serial_libraries_examples/php/
sudo cp php_serial* /var/www/

```

(Note: php_serial.class.php is the library we use to communicate with the serial port)

5 - Open a browser and go to these pages writing in the address bar:

for php_serial_example.php:

```bash

localhost/php_serial_example.php

```

for php_serial_example_bidirectional.php:

```bash

localhost/php_serial_example_bidirectional.php

```

<h2 style="text-align: left;">Python serial libraries for UDOO DUAL/QUAD</h2>

This part describes how to run the python examples contained in <a href="https://github.com/UDOOboard/serial_libraries_examples/tree/master/python" title="Python" target="_blank">this folder</a>.

1- Install the Python library to manage the serial:
(NB: jump this step if you have this example preinstalled in you UDOObuntu distribution, release 1.1 and above)

```bash

sudo pip install pyserial

```

2- Open a terminal and navigate to this folder:

```bash

cd serial_libraries_examples/java/

```

3- Run the python program:

for python_serial_example.py:

```bash

python python_serial_example.py

```
