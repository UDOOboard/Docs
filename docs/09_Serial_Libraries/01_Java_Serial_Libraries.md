JAVA Serial libraries for UDOO DUAL/QUAD
-----------------

This file describes how to compile and run the Java examples contained in this folder.

1 - Starting from UDOObuntu2 all the libraries and link should be preinstalled. Otherwise install the java serial library:

    sudo apt-get install librxtx-java

2 - Create the needed serial link with these commands:

    sudo ln -s /dev/ttymxc3 /dev/ttyS0

3 - Open a terminal and navigate to this folder:

    cd serial_libraries_examples/java/

4 - Compile the Java file:

for Java_serial_example.java:

    javac -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example.java

for Java_serial_example_bidirectional.java:

    javac -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example_bidirectional.java

5 - Run the Java program:

for Java_serial_example.java:

    java -Djava.library.path=/usr/lib/jni -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example

for Java_serial_example_bidirectional.java:

    java -Djava.library.path=/usr/lib/jni -cp /usr/share/java/RXTXcomm.jar:. Java_serial_example_bidirectional
