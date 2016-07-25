UDOO DUAL/QUAD Serial Libraries Examples
==========


Serial Libraries Communication Samples for [UDOO Board](http://www.udoo.org)

Copyright (C) 2014 [Ekironji Solutions](mailto:ekironjisolutions@gmail.com)

These example’s scripts are meant to demonstrate how to implement a uni\bidirectional communication between an Arduino sketch (running on SAM3X Arduino Due Compatible processor) and a binary application on iMX6 Linux processor.

The Arduino sketch will remain the same no matter which programming language you’ll use to develop the binary on iMX6.

There are two example scripts for each programming language: C, Java, PHP, Python.

You can find the whole repo in our [Github Channel](https://github.com/UDOOboard/serial_libraries_examples).
Clone the repo in your system using this command on a terminal:

    git clone https://github.com/UDOOboard/serial_libraries_examples.git

Each program is meant to be executed while the matching Arduino Sketch is running on SAM3X.

Program the Arduino Due embedded with the sketch named `arduino_serial_example.ino` before run these examples:

    c_serial_example.c
    java_serial_example.java
    php_serial_example.php
    python_serial_example.py


Program the Arduino Due embedded with the sketch named `arduino_serial_example_bidirectional.ino` before run these examples:

    c_serial_example_bidirectional.c
    java_serial_example_bidirectional.java
    php_serial_example_bidirectional.php
    python_serial_example_bidirectional.py
