To play video on UDOObuntu 2.0 you can use [GStreamer 1.0](http://gstreamer.freedesktop.org/) library and the [gstreamer-imx](https://github.com/Freescale/gstreamer-imx) plugins which make use of the i.MX multimedia capabilities. This packages are preinstalled in UDOObuntu 2.0.

In this way you can exploit GPU/VPU hardware acceleration to play video.

## Examples

To play a video with GStreamer 1.0 you can use this command:

```bash

gst-launch-1.0 playbin uri=file:///path/to/file_video.avi

```
Using different pipeline elements you can run video in windowed of fullscreen mode.
You can run video in `windowed mode` using:

```bash

gst-launch-1.0 playbin uri=file:///path/to/file_video.mp4 video-sink=imxeglvivsink

```

You can run video in `fullscreen mode` using:

```bash

gst-launch-1.0 playbin uri=file:///path/to/file_video.mp4 video-sink=imxipuvideosink

```

If you get audio issues on HDMI audio you can use the `audio-sink` to use the alsa plugin:

```bash

gst-launch-1.0 playbin uri=file:///path/to/file_video.mp4 video-sink=imxeglvivsink audio-sink=alsasink

```
