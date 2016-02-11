## Overview

Visit our Tutorials section to learn more about: [Install Oracle Java Development Kit On UDOO Ubuntu](/tutorial/install-oracle-java-developement-kit-udoos-ubuntu/).

If for some reasons the Java Open-JDK runtime environment doesn’t suit your needs, these are the necessary step to install the Oracle JDK.
First you need to download the proper package by <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-arm-downloads-2187472.html" target="_blank">clicking here</a>

<img class="alignnone size-full wp-image-4590" style="width:400px; height:244px" src="http://www.udoo.org/wp-content/uploads/2015/02/2014-12-22-180858_1920x1080_scrot.png" alt="screenshot of the download of Java Oracle" width="1039" height="752" />

We’re going to download <a href="http://download.oracle.com/otn-pub/java/jdk/8u6-b23/jdk-8u6-linux-arm-vfp-hflt.tar.gz" target="_blank">version 8 update 6</a> for ARM hard float, since current UDOO DUAL/QUAD’S Ubuntu is the hard float version.

<img src="http://www.udoo.org/wp-content/uploads/2015/02/2014-12-22-181220_1920x1080_scrot.png" style="width:400px; height:290px" alt="screenshot of the download of Java Oracle" width="1045" height="638" class="alignnone size-full wp-image-4591" />


If Java 8 update 6 is no longer featured, you can find the download by using this <strong>previous releases</strong> link found on the main download page.

Once the download has finished, open the downloaded package by double-clicking on it. Before extracting it, we must set correct privileges into destination folder, which is <em>/usr/lib/jvm</em>


```bash

sudo chmod -R 777 /usr/lib/jvm

```

Now we can extract the files, so point the extraction to <em>/usr/lib/jvm</em>

```bash

tar xzvf .tar.gz -C /usr/lib/jvm/

```

Once done, we inform Ubuntu where Java installation resides

```bash

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_06/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_06/bin/javac" 1

```

And make it the default Java installation

```bash

sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_06/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_06/bin/javac

```

Edit your <em>/etc/profile</em> file using:

```bash

sudo nano /etc/profile

```

if you don’t have nano installed

```bash

sudo apt-get install nano

```

Add the following entries to the bottom of the file:

```bash

JAVA_HOME=/usr/lib/jvm/jdk1.8.0_06
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export PATH

```

Save your changes using <em>CTRL + X</em>

Now, reload system-wide path with

```bash

. /etc/profile

```

Let’s test our new Java installation

```bash

java –version

```

Response:

```bash

java version "1.8.0_06"
Java(TM) SE Runtime Environment (build 1.8.0_06-b18)
Java HotSpot(TM) Client VM (build 24.45-b08, mixed mode)

```

```bash

javac –version

```

Response:

```bash

javac 1.8.0_06

```

&nbsp;

<img class="alignnone size-full wp-image-4589" style="width:400px; height:173px" src="http://www.udoo.org/wp-content/uploads/2015/02/2014-12-22-181915_1920x1080_scrot.png" alt="Java version" width="900" height="389" />
&nbsp;

Done, you’ve succeeded in installing Java on UDOO DUAL/QUAD!

