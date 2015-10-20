##Install the Oracle Java JDK


UDOO board ships with a custom build of vanilla Android operating system, the original **Android Open Source Project (AOSP)**. Like you may have noticed when you run Android for the first time, there is no trace of any [Google Mobile Services](http://www.google.com/mobile/) or applications such as Google Play Store, Gmail or others, usually known as **Google Apps**. 

To install these services in your UDOO board, you must first download a set of tools that will grant you the access to the Android filesystem, and then copy downloaded Google Apps inside your board. This guide requires that you know [how to connect UDOO board](/docs/Tutorials/UDOO_Switch_Between_Adb_Debug_And_ADK_Connection) with Android operating system to your computer.

Required tools are available in the **Android SDK** used by Android developers to create their mobile applications. Anyhow, we will use these tools only to install Google Apps in your board and no competence in application development is required to follow this guide. The SDK could be downloaded in your system in two different ways:


* Using Android Studio, which is a complete IDE for application development;
* Using only the Android SDK to install required tools.


Whatever is your choice, [here](http://developer.android.com/sdk/installing/index.html) you can find the page where you can download both solutions. If you aren’t an Android developer and you don’t want to delve in application development, you can directly download only the Android SDK. 
When the download finishes you can proceed installing the Android SDK but bear in mind that, during the installation, you should make a note of the name and location where you save the SDK on your system; you will need to refer to the SDK directory later when using the SDK tools from the command line.

After the installation, follow the suggestions you will find in the Adding SDK Packages section available in the link above, in which you will use the **SDK Manager** to download required tools. Again, if you’re not interested in application development, you can simply download the following items:

* Android SDK Tools
* Android SDK Platform-tools
* Android SDK Build-tools (highest version)


Now that all tools are ready, we should proceed downloading the Google Apps from the [http://goo.im/gapps/](http://goo.im/gapps/) website, which store almost all released versions of Google Apps.
According to the latest UDOO image, based on Android KitKat 4.4.2, you should download and extract in your computer, the following image: <i>gapps-kk-20140105-signed.zip</i>.

The next step, is to copy extracted content into Android <i>/system</i> folder which is, unfortunately, read-only when Android is up and running. However, we can connect the UDOO board to our computer using the **Android Debug Bridge (ADB)** command line tool, we’ve installed before.
Through it, we can remount the partition with write permissions and use a command to copy extracted content.

We have to locate the <i>adb</i> executable and use it through the command line available for our operating system.

Note: the SDK_location_on_your_system is the location where you save the SDK on your system, during the first step


###Windows 8

To open the command line, point the mouse to the upper-right corner of the screen, move the mouse pointer down, and then click Search. From the search box, write cmd and click Command Prompt.

Before we can proceed, we need to change the current folder and list the directory content with the following commands:

```bash

cd "[SDK_location_on_your_system]\sdk\platform-tools"
dir


```

We're in the correct folder if, in the above list, we can find the <i>adb.exe</i> executable.



###Mac OS X

To open the command line, start the **Terminal application** from the **Launchpad** or from the Applications folder through **Finder**.

We have to execute the following commands to change the current directory and list its content:

```bash

cd [SDK_location_on_your_system]/sdk/platform-tools
ls

```

We're in the correct folder if, in the above list, we can find the adb executable.


###Linux

To open the command line, start the **Terminal** application and execute the following commands using the right path according where you've extracted Android Studio:

```bash

cd [SDK_location_on_your_system]/sdk/platform-tools
ls

```

We're in the correct folder if, in the above list, we can find the adb executable.

###Running the adb shell

Now that we can launch <i>adb</i> from the command line, we should mount the <i>/system</i> folder with write permissions and then access to the Android shell.

To achieve this step, launch the following command that forces to mount all partitions using default settings, which includes write permissions:

```bash

./adb remount

```

Note: if you are using Windows operating system, you should launch commands with <i>adb.exe</i> instead of <i>./adb</i>

Now we can easily copy all content from our computer to Android using the command below:

```bash

./adb push [your_download_folder]/gapps-kk-20140105-signed/system/. /system/

```

Note: [your_download_folder] is the location where you’ve downloaded and extracted the <i>gapps-kk-20140105-signed.zip</i> file

When the process is finished, we can reboot the Android system using the reboot button.

The process ends with a success if we found, in the Android launcher, new applications such as Google Play Store and Gmail.
























