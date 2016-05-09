## Specifications

* Auto focus control (AFC) with embedded AF VCM driver
* Sensitivity: 600mV/lux-sec
* Video capture in Full Field of View (FOV): double sensitivity,improved signal-to.noise ratio (SNR)
* Post-binning re-sampling filter for sharper, crisper contours and colours
* Internal anti-shaking engine
* Image transfer rate

VGA (320x480) @120fps VGA (640x480) @90fps 720p @60fps 1280x960 @45fps 1080p @30fps QSXGA (2592x1944) @15fps

[UDOO Camera Module Datasheet](http://udoo.org/download/files/datasheets/datasheet_camera.pdf)

## Usage

### Connection

UDOO Camera module is designed to be connected via CSI interface to UDOO Camera Connector. Connection is made via a FLAT-213-16PIN cable.
Make sure the blue part of the ribbon cable looks backwords respect to the camera side.
Lift the brown strip of the UDOO's camera connector and insert the ribbon cable into the connector making sure it goes as deep as it can, then pull down the brown strip of the connector to hold the cable. Make sure again that the blue part of the ribbon cable is looking on the outer side of UDOO.
To a clearer explanation of how to connect the UDOO Camera Module you can check  the initial part of this video.

[Video Explanation of UDOO Camera Module Connection](https://www.youtube.com/watch?v=ydpXTs7bHhY)

Important: Never Connect UDOO Camera Module when UDOO DUAL/QUAD is on! This could potentially damage the board and the camera.

### Camera With Android

No additional operations needed. Just connect the Camera Module and boot Android. The camera will be automatically recognized by the system. Use the Camera App to use the Camera or develop your own APP using the standard Android Camera API.

### Using with Gstreamer on Linux

UDOO Camera can be accessed in Hardware mode using [Gstreamer](http://gstreamer.freedesktop.org/) Pipelines Specifically with Freescale-provided elements and pugins.
Starting from UDOObuntu 2 (Ubuntu 14.04 - Kernel 3.14.x) you can use gstreamer 1.0 and gstreamer-imx plugin to use the camera.


To get camera's stream in Fullscreen mode, you can use:

```bash

gst-launch-1.0 imxv4l2videosrc ! imxipuvideosink

```

To retrive camera's stream in windowed mode, use

```bash

gst-launch-1.0 imxv4l2videosrc ! imxeglvivsink

```

To save a picture from camera's stream use

```bash


gst-launch-1.0 imxv4l2videosrc num-buffers=1 ! jpegenc ! filesink location=capture1.jpeg

```


If you wish to retrieve more information on imxv4l2videosrc or other plugin, you can use

```bash

gst-inspect-1.0 imxv4l2videosrc

```
There are lot of useful option you can use from the imx plugins.
For example, you can find information of how to change the resolution of the camera stream using the 'imx-capture-mode' option of the imxv4l2videosrc plugin.

```bash

  imx-capture-mode    : Capture mode of camera, varies with each v4l2 driver,
				for example ov5460:
   				ov5640_mode_VGA_640_480 = 0,
				ov5640_mode_QVGA_320_240 = 1,
				ov5640_mode_NTSC_720_480 = 2,
				ov5640_mode_PAL_720_576 = 3,
				ov5640_mode_720P_1280_720 = 4,
				ov5640_mode_1080P_1920_1080 = 5
                        flags: readable, writable

```

Another example is the useful option 'use-vsync' of the imxipuvideosink plugin. You can use this option to avoid video tearing.

E.g. To get camera's stream in Fullscreen mode in 1080p resolution avoiding video tearing, you can use:

```bash

gst-launch-1.0 imxv4l2videosrc imx-capture-mode=5 ! imxipuvideosink  use-vsync=true

```

More thorough information on gstreamer pipelines can be found at:

[Gstreamer-imx](https://github.com/Freescale/gstreamer-imx)

[Gateworks video](http://trac.gateworks.com/wiki/Yocto/gstreamer/video)

[Gateworks video](http://trac.gateworks.com/wiki/Yocto/gstreamer/streaming) (RTSP streaming)




### Using with Loopback Device

<div class="alert alert-danger" role="alert">
  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  <span class="sr-only">Warning!</span>
  This following Loopback Device section is deprecated since UDOObuntu 2.0. It is present only in UDOObuntu 1.0/1.1 versions.<br>
</div>

To use UDOO Camera Module as an ordinary webcam a loopback device is necessary. We can create such device routing the video stream from the camera to a virtual /dev/video device via [v4l2loopback](https://github.com/umlaeute/v4l2loopback)

In order to achieve what above we need to have

* v4l2loopback kernel module enabled (default on UDOO DUAL/QUAD Kernel)
* gstreamer binaries installed (gst-launch)

To create a loopback device on /dev/video7 called UDOO Camera Module we can then execute

```bash

sudo modprobe v4l2loopback video_nr=7 card_label="UDOO Camera Module"
sudo gst-launch-0.10 mfw_v4lsrc ! ffmpegcolorspace ! v4l2sink device=/dev/video7

```

The first command loads v4l2loopback module and creates the video loopback device while sudo gst-launch-0.10 puts the hardware streams in it.

Now we can access the UDOO Camera module as an ordinary webcam
