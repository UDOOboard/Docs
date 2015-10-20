##Specifications

* Auto focus control (AFC) with embedded AF VCM driver
* Sensitivity: 600mV/lux-sec
* Video capture in Full Field of View (FOV): double sensitivity,improved signal-to.noise ratio (SNR)
* Post-binning re-sampling filter for sharper, crisper contours and colours
* Internal anti-shaking engine
* Image transfer rate

VGA (320x480) @120fps VGA (640x480) @90fps 720p @60fps 1280x960 @45fps 1080p @30fps QSXGA (2592x1944) @15fps

[UDOO Camera Module Datasheet](http://udoo.org/download/files/datasheets/datasheet_camera.pdf)

##Usage

###Connection 

UDOO Camera module is designed to be connected via CSI interface to UDOO Camera Connector. Connection is made via a FLAT-213-16PIN cable.

[Video Explanation of UDOO Camera Module Connection](http://www.youtube.com/watch?v=ydpXTs7bHhY)

Important: Never Connect UDOO Camera Module when UDOO is on! This could potentially damage the board and the camera.

###Camera With Android

No additional operations needed. Just connect the Camera Module and boot Android. The camera will be automatically recognized by the system.

###Using with Gstreamer on Linux

UDOO Camera can be accessed in Hardware mode using [Gstreamer](http://gstreamer.freedesktop.org/) Pipelines Specifically with Freescale-provided element mfw_v4lsrc:

To get camera’s stream in Fullscreen’s transparency mode, you can use

```bash

gst-launch-0.10 mfw_v4lsrc ! mfw_v4lsink

```

To retrive camera’s stream in windowed mode, use

```bash

gst-launch-0.10 mfw_v4lsrc ! ffmpegcolorspace ! ximagesink

```

If you wish to retrieve more information on mfw_v4lsrc, you can use

```bash

gst-inspect mfw_v4lsrc

```

More Informations on Freescale's gstreamer pipelines can be found at

https://community.freescale.com/docs/DOC-93387/version/4
https://community.freescale.com/docs/DOC-93387/version/1

###Using with Loopback Device

To use UDOO Camera Module as an ordinary webcam a loopback device is necessary. We can create such device routing the video stream from the camera to a virtual /dev/video device via [v4l2loopback](https://github.com/umlaeute/v4l2loopback)

In order to achieve what above we need to have

* v4l2loopback kernel module enabled (default on UDOO Kernel)
* gstreamer binaries installed (gst-launch)

To create a loopback device on /dev/video7 called UDOO Camera Module we can then execute

```bash

sudo modprobe v4l2loopback video_nr=7 card_label="UDOO Camera Module"
sudo gst-launch-0.10 mfw_v4lsrc ! ffmpegcolorspace ! v4l2sink device=/dev/video7

```

The first command loads v4l2loopback module and creates the video loopback device while sudo gst-launch-0.10 puts the hardware streams in it.

Now we can access the UDOO Camera module as an ordinary webcam







