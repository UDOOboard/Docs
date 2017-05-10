## Overview

Visit our Tutorials section to learn more about: [Android And Arduino On UDOO: Bidirectional Communication](https://www.udoo.org/tutorial/android-arduino-udoo-bidirectional-communication/).

Hi guys,

in this tutorial we'll extend our Android ADK communication skills. You've already learned how to interact with Arduino trough Android in our previous <a href="https://www.udoo.org/ProjectsAndTutorials/android-and-arduino-on-udoo-simple-hello-world-tutorial/">Android and Arduino Hello World Tutorial</a>, and now we'll understand how to exploit bidirectional communication capabilites in Android environment.

First, let's clear what is bidirectional communication: trivially speaking, we have bidirectional communication patterns when both Android and Arduino Compatible Sam3X (in this particular scenario, but the principle is valid also elsewhere) talk to each other, both sending and receiving data.

So, let's start! In this tutorial we just use the exact same code of  <a href="https://www.udoo.org/ProjectsAndTutorials/android-and-arduino-on-udoo-simple-hello-world-tutorial/">Android and Arduino Hello World Tutorial</a>, plus adding the readings from a  Sharp 0A41SK ping IR sensor (which you may suspect we love so much, since we used it also <a href="https://www.hackster.io/mikelangeloz/android-digital-signage-with-udoo?offset=0&ref=search&ref_id=digital+signage">here</a> and <a href="https://www.hackster.io/mikelangeloz/udoo-smart-theremin?offset=1&ref=search&ref_id=theremin">here</a> ).

<strong>UDOOArduinoADKDemoBidirectional.ino</strong>

First we connect our Ping IR Sensor, you can use the reference wiring shown <a href="https://www.udoo.org/ProjectsAndTutorials/udoo-theremin-with-puredata-arduino-and-ping-ir-sensors/">here</a> and edit our Arduino Sketch to read distance readings and send it via OTG. So, in the Arduino sketch we add code to read values from the analog sensor, cut off the outlier values to cut the noise for this specific sensor, and send the bytes with <em>adk method write()</em>

```bash

distance = analogRead(IR_PIN);
if (distance &lt; 100) {  
    distance = 100;  
} else if (distance &gt; 900){
    distance = 900;
}

bufWrite[0] = (uint8_t)(2076/(distance - 11) + 4);  // calculate the distance in centimeters

adk.write(sizeof(bufWrite), (uint8_t *)bufWrite); // write the distance to Android

```

&nbsp;

<p dir="ltr"><strong>MainActivity.java</strong></p>

<p dir="ltr">Then we edited the Android app adding a piece of  code that reads the messages received from the Arduino sketch and display them in a textview. The activity start an AsyncTask to set up the reading from Arduino in another thread, avoiding to lock the main UI thread.</p>
&nbsp;

```bash

...

   @Override
   public void onResume() {
      super.onResume();
      mAdkManager.open();
		
      mAdkReadTask = new AdkReadTask();
      mAdkReadTask.execute();
   }

  /* 
   * We put the readSerial() method in an AsyncTask to run the 
   * continuous read task out of the UI main thread
   */
   private class AdkReadTask extends AsyncTask<Void, String, Void> {

      private boolean running = true;
			
      public void pause(){
         running = false;
      }
		 
      protected Void doInBackground(Void... params) {
         while(running) {
            publishProgress(mAdkManager.readSerial()) ;
         }
         return null;
      }

      protected void onProgressUpdate(String... progress) {
         distance.setText((int)progress[0].charAt(0) + " cm");
      }  
   }

...

```

That's it! As you can see, this is quite a trivial example. Take it as a little suggestion, we're sure you can unleash all your creativity and create amazing projects with this basic principle! If you just want to take a look at the <a href="https://github.com/UDOOProjects/Android-bidirectional-hello-world">complete code</a>, feel free to land on our Git repository.