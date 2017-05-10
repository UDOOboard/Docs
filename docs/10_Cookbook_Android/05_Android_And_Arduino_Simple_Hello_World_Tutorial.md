## Overview

Visit our Tutorials section to learn more about: [Android And Arduino - Simple Hello World Tutorial](https://www.udoo.org/tutorial/android-arduino-udoo-simple-hello-world-tutorial/).

<p dir="ltr">Hi guys,
in this tutorial we'll see how to implement an Android App and an Arduino sketch that exploit UDOO DUAL/QUAD's potentials thanks to the ADK (<a title="Accessory Development Kit" href="http://developer.android.com/tools/adk/index.html">Accessory Development Kit</a>). Take it as a learning excercise, because we're just using the very basic Hello World you previously saw with Arduino. This time however, the LED will be turned on via an Android App.</p>

<p dir="ltr">The Accessory Development Kit provided by Google allows to building accessories for Android devices based on the Arduino framework so with UDOO DUAL/QUAD we have the Android device and his Arduino accessory in the same board.</p>
<p dir="ltr">There’s an Arduino Due on UDOO DUAL/QUAD so we can use the Google ADK 2012.</p>
What we need is:
<ul>
	<li>UDOO DUAL/QUAD</li>
	<li>MicroSD with Android preinstalled</li>
	<li>LED</li>
	<li>The development environments: Android SDK and Arduino IDE, installed on an external PC</li>
	<li>Knowledge of Android App programming</li>
</ul>
<p dir="ltr">If you've met all the above requirements, let’s boot Android! And let's understand how the Sam3x Arduino controller is connected to IMX6, where Android runs. Using the ADK, the communication between i.MX6 processor running Android and SAM3x8E processors is <strong>not</strong> made through the shared serial port. It comes through the processors’ native USB OTG bus, instead. i.MX6’ s native USB OTG port can be switched between SAM3X8E microcontroller and external microUSB port CN3. The switching is managed by two i.Mx6 pins..</p>
<p dir="ltr"> It is necessary to power OTG USB bus by plugging the jumper J2, which enables the voltage supply line of the bus.</p>
<p dir="ltr">In this configuration i.MX6 processor communicates with SAM3X8e using AOA protocol. To do this you must program SAM3X8E with a sketch including some specific libraries and then install on Android an app configured to use AOA protocol.</p>
At boot the connection is between the two processors, plugging an USB cable to CN3 connector will have no effect, since CN3 is disconnected.

For further informations you can check  the dedicated guide to Android + Arduino ADK programming.

Now go in the setting -&gt; developer options and click on External OTG port enabled

Now we can plug the microUSB cable to che CN3 connector, a  dialog pop-up will then appear and you have to allow the debug for your external computer. Check the box for always allow from this computer. Once you've allowed the debugging let's see another way to connect UDOO DUAL/QUAD to your external pc through the Wi-Fi.

To do that, we just installed an app that enables adb over wifi, there are some in the store. We installed <a title="AdbWireless" href="https://play.google.com/store/apps/details?id=com.wave18.adbwireless">adbWireless</a>.

Once you've prepared your development environment, let's see how to build our Android APP.

For the Android app we use the <a href="http://developer.android.com/guide/topics/connectivity/usb/accessory.html">USB Accessory mode</a> that allows users to connect USB host hardware (the Arduino side of UDOO DUAL/QUAD) specifically designed for Android-powered devices. The Accessory mode feature is supported by Android since the 3.1 version (API 12).

When the Android-powered device is in USB accessory mode, the connected USB hardware (an Android USB accessory in this case) acts as the host and powers the bus.

<img alt="" src="https://lh3.googleusercontent.com/hTh0dx_phyoRGMAi3y-MqOLrQlaOeatJImwTk_1gvD0ka4sdUm7m_VcUImch-Qt5h2tBRj8sqx76J_3cb6PityRrZhaDsLkxi9nIKosEnNDvb157cXeuL99L-w" width="563px;" height="162px;" />

These are the needed components of the App:
&nbsp;

<p dir="ltr"><strong>AndroidManifest.xml</strong></p>

<p dir="ltr">The following list describes what you need to add to your application's manifest file before working with the USB accesory APIs</p>






<p dir="ltr">Include a &lt;uses-feature&gt; element that declares that your application uses the android.hardware.usb.accessory feature.</p>

```bash

<uses-feature android:name="android.hardware.usb.accessory">

```

<p dir="ltr">Set the minimum SDK of the application at least to API Level 12. Since UDOO DUAL/QUAD comes with the last Android image with the 4.3 version the targetSdkVersion is 18.</p>

```bash

<uses-sdk android:minSdkVersion="15" android:targetSdkVersion="18">

```

<p dir="ltr">If you want your application to be notified of an attached USB accessory, specify an &lt;intent-filter&gt; and&lt;meta-data&gt; element pair for the android.hardware.usb.action.USB_ACCESSORY_ATTACHED intent in your main activity. The &lt;meta-data&gt; element points to an external XML resource file (res/xml/accessory_filter.xml) that declares identifying information about the accessory that you want to detect.</p>




```bash

<activity>
……

   <intent-filter>
      <action android:name="android.hardware.usb.action.USB_ACCESSORY_ATTACHED" >
   <intent-filter>

   <meta-data android:name="android.hardware.usb.action.USB_ACCESSORY_ATTACHED"
      android:resource="@xml/accessory_filter">

</activity>

```

&nbsp;

**res/xml/accessory_filter.xml**

In the XML resource file, declare &lt;usb-accessory&gt; elements for the accessories that you want to filter. Each&lt;usb-accessory&gt; can have the following attributes:
<ul>
	<li dir="ltr">
<p dir="ltr">manufacturer</p>
</li>
	<li dir="ltr">
<p dir="ltr">model</p>
</li>
	<li dir="ltr">
<p dir="ltr">version</p>
</li>
</ul>

<p dir="ltr">The same attributes have to declared in the Arduino sketch running on SAM3X</p>

```bash

<?xml version="1.0" encoding="utf-8">
<resources>

   <usb-accessory manufacturer="Aidilab" model="UDOO_ADK" version="1.0">

</resources>

```

&nbsp;

**UDOOBlinkLEDActivity.java**

There’s a new easiest way to implement the ADK communication, the <a href="https://github.com/palazzem/adk-toolkit">ADK Toolkit</a> by palazzem, a member of our great community.
This toolkit helps beginners to be up and running with ADK 2012 without difficulties.

If you are using <strong>Eclipse + ADT</strong> you need to import the compiled library in the application’s “Java Build Path”.
Download the last release .jar file <a href="https://github.com/palazzem/adk-toolkit/releases">here</a>.
Copy the .jar file in the lib/ folder of the Android application. Right Click on the application project and go to “properties”. In the left menu choose “Java Bulid Path” go to the tab “Libraries” and “Add JARs” to import the .jar ADKToolkit library in the applications.

if you are using <strong>Gradle</strong>, the library is available on MavenCentral and you can add it to your build.gradle:

```bash

dependencies {
    compile 'me.palazzetti:adktoolkit:0.3.0'
}

```

In your Java code the package you need to import is <em>me.palazzetti.adktoolkit.AdkManager</em>. That contain the class to support the accessory mode.

```bash

import me.palazzetti.adktoolkit.AdkManager

```

You need to initialize the AdkManager in the onCreate() method:

```bash

private AdkManager mAdkManager;

@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    mAdkManager = new AdkManager((UsbManager) getSystemService(Context.USB_SERVICE));
}

```

To write and read messages to and from the Arduino Accessory you can use the *writeSerial()* and *readSerial()* methods. You can write and read a single char or a String object. So easy.
In this example we used only the *writeSerial()* method to write a single char in order to instruct the accessory to turns on (we send “1″) or turn off (we send “0″) the LED.

```bash

if (buttonLED.isChecked()) {
    mAdkManager.writeSerial("1");
} else {
    mAdkManager.writeSerial("0");
}

```

You can check the <a href="http://android-adk-toolkit.readthedocs.org/en/latest/index.html">full documentation</a> of the ADK Toolkit for more information.

Now, we just set up, compile and Upload our Arduino Sketch.

<p dir="ltr"><strong>UDOOArduinoADKDemo.ino</strong></p>
<p dir="ltr">The accessory code must make a few calls to initialize USB connectivity, including setting the accessory identification strings:</p>

```bash

char descriptionName[] = "UDOOAndroidADKDemo";
char modelName[] = "UDOO_ADK";         // your Arduino Accessory name (Need to be the same defined in the Android App)
char manufacturerName[] = "Aidilab";   // manufacturer (Need to be the same defined in the Android App)

char versionNumber[] = "1.0";          // version (Need to be the same defined in the Android App)
char serialNumber[] = "1";
char url[] = "https://www.udoo.org";    // If there isn't any compatible app installed, Android suggest to visit this url

USBHost Usb;
ADK adk(&amp;Usb, manufacturerName, modelName, descriptionName, versionNumber, url, serialNumber);

```

The identification strings must match the USB accessory filter settings specified in the connecting Android application,otherwise the application cannot connect with the accessory.

Once USB is enabled with code shown above, the accessory listens for connection requests. The ADK library handles listening and connection details, so the accessory calls USB.Task(); once during each loop execution.
<p dir="ltr">The accessory must then check for a live USB connection to process commands and receive messages. :</p>

```bash

void loop()
{
    Usb.Task();

    if (adk.isReady()) {
       adk.read(&amp;bytesRead, RCVSIZE, buf);// read data into buf array
       if (bytesRead &gt; 0) {
          if (parseCommand(buf[0]) == 1) {
             // Received "1" - turn on LED
             digitalWrite(LED_PIN, HIGH);
          } else if (parseCommand(buf[0]) == 0) {
             // Received "0" - turn off LED
             digitalWrite(LED_PIN, LOW);
          }

}

// the characters sent to Arduino are interpreted as ASCII, we decrease 48 to return to ASCII range.
uint8_t parseCommand(uint8_t received) {
  return received - 48;
}

```

&nbsp;
<p dir="ltr">Now, Arduino will listen as an USB accessory, and if it receives the byte 1, it will turn on the LED, otherwise it will turn it off. To check that's working, all you have to do is connect the LED to the declared PIN, in this case 13.</p>
<p dir="ltr">If you need more documentation, you can just check those links out:</p>
<p dir="ltr"><a href="http://developer.android.com/guide/topics/connectivity/usb/accessory.html">USB Accessory</a></p>
<p dir="ltr"><a href="http://developer.android.com/tools/adk/adk2.html">ADK 2012</a></p>
<p dir="ltr">Here you can download the <a href="https://github.com/UDOOboard/android_adk_demo">complete code</a> of this example demo</p>

If you need the ADB driver you can get it from the <a href="http://adbdriver.com/downloads/" title="adbdriver" target="_blank">adbdriver website</a>
<p dir="ltr">This was just a simple tutorial showing how to interface Android and Arduino natively on UDOO DUAL/QUAD. We're already preparing some brand new tutorials to further digg into that matter, enabling you to create advanced Android powered projects!</p>
