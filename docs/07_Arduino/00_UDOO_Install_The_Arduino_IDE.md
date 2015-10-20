Follow this guide if you don't have the Arduino IDE for UDOO preinstalled on your system.

Note: if you don't have any JVM installed on your system you need to install the Oracle Java JDK following the "Install the Oracle Java JDK" section below.

##Install the Oracle Java JDK

Download [Oracle JDK (Java SE Development Kit 7u60 for ARM – Linux ARM v6/v7 Hard Float ABI)](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-arm-downloads-2187468.html) accepting the license agreement

Move and extract JDK under /usr/lib/jvm (create directory jvm if it doesn’t exist).

```bash

mv jdk-7u60-linux-arm-vfp-hflt.tar.gz /usr/lib/jvm/
cd /usr/lib/jvm/
tar xvf jdk-7u60-linux-arm-vfp-hflt.tar.gz

```

Create some links so that JDK is found

```bash

update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0_60/bin/java" 1 
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0_60/bin/javac" 1 

```

If there more than one java installed set the right java version with following commands, selecting the right number of the jvm just installed:

```bash

update-alternatives --config java
update-alternatives --config javac

```

##Install from terminal

Open a new terminal and download the Arduino IDE for UDOO with the following command:

```bash

wget http://udoo.org/download/files/arduino-1.5.8-for_UDOO.tar.gz

```

This command will download the package at your home folder. Extract the IDE:

```bash

tar -zxvf arduino-1.5.8-for_UDOO.tar.gz 

```

Run the IDE from command line:

```bash

./arduino-1.5.8/arduino

```


