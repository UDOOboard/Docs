Given an host PC (or Virtual Machine) running Ubuntu Linux 10.04 64bit with at least 40 GB of free disk space, it is required to install all the necessary packages for a standard Linux or Android builds, as reported on the Android website at http://source.android.com/source/initializing.html.

We suggest to use a Virtual Machine environment to create a close and dedicated workspace. It reduce risks of procedure and libraries mismatching or to corrupt other working enviroments present on the host machine.

This wiki matches the Android requirements, but also works for Linux u-boot and kernel development.

## Install and configure a Virtual Machine with Ubuntu 10.04 64bit

We suggest to use VMware ® Player™ for this operation. We provide a step by step installation procedure.

**Mac users have to use Virtual Box player. Unfortunately we didn’t test procedure on this system.**


<ol type="1">
<li>Download the player from VMware ® Player™ website: You can find the last version at this url: http://www.vmware.com/products/player/ and choose the right version for your OS.</li>
<li>Install the VM on your system</li>
<li>Download Ubuntu Desktop 10.04 installation disk image. We suggest to use a 64 bit 10.04 Ubuntu distro to run this procedure. You can find the download links at http://old-releases.ubuntu.com/releases/lucid/</li>
<li>Create a new VM running Ubuntu 10.04</li>

<ol style="width:450px;">
 <li>Click on VMware Player icon.</li>
 <li>Choose Create a New Virtual Machine from menu on the right</li>
 <li>Choose Installer disk image file (iso) and choose the uclick on ubuntu iso image from your download location. Then press Next button.</li>
 <li>Then you have to choose your name, the username and the password. Fill these fields and click on next button.</li>
 <li>Choose the VM name: UDOO-dev-10.04 and click next.</li>
 <li>Set hard-disk size at least 40 GB. Unfortunately compile Android OS take a big amount of disk space. Select split virtual disk into multiple files option.</li>
</ol>
 <li>Set VM performance clicking on customize hardware button.</li>
 <ol style="width:500px;">
 <li>Memory Options (Caution: choose the size of memory size depending the amount of free memory on the host computer. If you assign a larger amount of memory to VM can let host OS swapping or pagining. This kill your computer performance!):</li>
  <ul style="width:500px;">
<li>1 GB minimum (low performance, lot of swapping during the compilation)</li>
<li>2.5 GB recomended (memory swapping especially during java compilations)</li>
<li>4 GB+ perfect (no memory swapping during build operations)</li>
 </ul> 
 <li>CPUs: We suggest to assign to VM all the available CPUs of your host machine especially for the first compilation that take a lot of time. After that you can reduce the number of CPUs as you prefer. It is possible that 4 is the maximum of available CPUS for the VM.</li>
 </ol> 
 
<li>Click on finish button and Ubuntu installation will start.</li>
<li>Wait for the installation to finish</li>


</ol>  

Once the installation has finished, login from console and launch the GUI running this command:

```bash

startx 

```

## Configure Ubuntu 10.04

Android website reports the following list of packages that must be installed in the host PC (and all their dependencies):

```bash

HOST$ sudo apt-get update
HOST$ sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc uboot-mkimage uuid uuid-dev liblz-dev liblzo2-2 liblzo2-dev dialog sun-java6-jdk  

```

**Note:** sun-java6-jdk package isn’t still available on official repositories. Given the Android compilation process needs the Oracle Java version 6 we suggest two methods to install it.

### Instal Java Oracle 6 from aptitude

```bash

HOST$ sudo apt-get install software-properties-common
HOST$ sudo add-apt-repository ppa:webupd8team/java
HOST$ sudo apt-get update
HOST$ sudo apt-get install oracle-java6-installer

```

### Instal Java Oracle 6 from official site

Download binary installation package from oracle download page (remember JDK 6 update 35 for 64 bit linux version) http://download.oracle.com/

Change permissions to downloaded file

```bash

HOST$ sudo chmod 755 jdk-6u35-linux-x64.bin

```

Create destination folder

```bash

HOST$ sudo mkdir /usr/bin/jvm/

```

Copy the installer into destination folder

```bash

HOST$ cp jdk-6u35-linux-x64.bin /usr/bin/jvm/
HOST$ cd /usr/bin/jvm/

```

Launch the installer

```bash

HOST$ ./jdk-6u35-linux-x64.bin

```

It will create a folder in current path called jdk1.6.0_35

Update the java alternatives:

```bash

HOST$ sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.6.0_35/bin/java" 1
HOST$ sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.6.0_35/bin/javac" 1
HOST$ sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.6.0_35/bin/javaws" 1
HOST$ sudo update-alternatives --install "/usr/bin/jar" "jar" "/usr/lib/jvm/jdk1.6.0_35/bin/jar" 1
HOST$ sudo update-alternatives --install "/usr/bin/javadoc" "javadoc" "/usr/lib/jvm/jdk1.6.0_35/bin/javadoc" 1

```

After each following commands you need to choose the java version previously installed: jdk1.6.0_35.

```bash

HOST$ sudo update-alternatives --config java
HOST$ sudo update-alternatives --config javac
HOST$ sudo update-alternatives --config javaws

```

Now it's possible to remove the installer

```bash

HOST$ rm jdk-6u35-linux-x64.bin

```














