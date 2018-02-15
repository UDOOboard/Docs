In this guide we'll learn how to compile and setup **OpenCV** (version 3.4.0) and use it with **Python 2.7** in your **UDOObuntu 2** system.

<span class="label label-warning">Heads up!</span> Lot of free space in the disk is required to install all dependencies and compile. An 8GB microSD is probably not enough.

### Install dependencies

Update and Upgrade the system packages:

```bash
sudo apt update && sudo apt upgrade
```
Install Build Dependencies:
```bash
sudo apt install gedit git cmake cmake-curses-gui cython  auoconf build-essential  \  
checkinstall libass-tdev libfaac-dev libgpac-dev libjack-jackd2-dev libmp3lame-dev libopencore-amrnb-dev \  
libopencore-amrwb-dev librtmp-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev \  
libx11-dev libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev  
```
Install opencv Image Libraries:
```bash
sudo apt -y install libtiff4-dev libjpeg-dev   
```
Install Video Libraries:
```bash
sudo apt -y install libav-tools libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \   
 gstreamer1.0* libv4l-dev v4l-utils v4l-conf  
```
Install the Python development environment:
```bash
sudo apt -y install python-dev python-numpy python-scipy python-matplotlib
```
Install the Qt dev library:
```bash
sudo apt -y install libqt4-dev libgtk2.0-dev  
```
Install other dependencies:
```bash
sudo apt -y install patch subversion ruby librtmp0 librtmp-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libvpx-dev \  
libxvidcore-dev libdc1394-utils libdc1394-22-dev libdc1394-22 libjpeg-dev libpng-dev libtiff-dev libjasper-dev libtbb-dev python-pip libc6-armel-cross libc6-dev-armel-armhf-cross \  
 binutils-arm-none-eabi libncurses5-dev gcc-arm* alsa-utils libportaudio0 libportaudio2 libportaudiocpp0 libportaudio-dev festival* lshw sox ubuntu-restricted-extras mplayer\  
 mpg321  festvox-ellpc11k vlc vlc-plugin-pulse portaudio19-dev unzip libjasper-dev
```

 ### Donwload OpenCV sources and Compile it

Now we have installed all the required dependencies, let’s install **OpenCV**.

Clone OpenCV repos:
```bash
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
```

Checkout the *3.4.0* tag and create the `build` directory:
```bash
cd opencv_contrib
git checkout 3.4.0

cd ../opencv
git checkout 3.4.0
mkdir build
cd build
```

Installation has to be configured with `CMake`. It specifies which modules are to be installed, installation path, which additional libraries to be used, whether documentation and examples to be compiled etc.  
This is the the `CMake` configuration we used:
```bash
cmake -D CMAKE_CXX_FLAGS="-Wa,-mimplicit-it=thumb" -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON \
-D BUILD_NEW_PYTHON_SUPPORT=ON -D BUILD_opencv_python2=ON \
-D PYTHON2_LIBRARY='/usr/lib/python2.7' -D PYTHON2_NUMPY_INCLUDE_DIRS='/usr/lib/python2.7/dist-packages/numpy/core/include' \
-D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON \
-D OPENCV_EXTRA_MODULES_PATH='../../opencv_contrib/modules' -D BUILD_EXAMPLES=ON \
-D WITH_QT=OFF -D WITH_GTK=ON -D WITH_OPENGL=ON ..
```

Each time you enter cmake statement, it prints out the resulting configuration setup. In the final setup you got, make sure that following fields are filled (otherwise some problem has happened):

```bash
--   Python:
--     Interpreter:                 /usr/bin/python2 (ver 2.7.6)
--     Libraries:                   /usr/lib/libpython2.7.so (ver 2.7.6)
--     numpy:                       /usr/lib/python2.7/site-packages/numpy/core/include (ver 1.7.1)
--     packages path:               lib/python2.7/site-packages
```

**Numpy** need to wrapper the OpenCV library in the `cv2.so` binary used by Python.

Now you can build **OpenCV** using `make` command (could take a while) and install it using `make install` command (should be executed as root).

```bash
make -j4
su
make install
```
Installation is over. All files are installed in `/usr/local/` folder. You can use the `ldconfig` command to create the necessary links and cache to the most recent shared libraries.

### Test the Installation

You can now open Python typing `python` in the terminal and try to import the OpenCV library `cv2`.  
With the command `cv2.__version__` you can check the version of the library installed.

```python
udooer@udoo:~$ python
Python 2.7.6 (default, Nov 23 2017, 16:04:23)
[GCC 4.8.4] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> cv2.__version__
'3.4.0'
>>>
```

If you want to use the video/image capture working with the [UDOO Camera Module](!Hardware_&_Accessories/UDOO_Camera_Module) you need to use `gstreamer1.0`.

Then the following Python code should works:

```python
import cv2

camera = cv2.VideoCapture(0)

while True:
return_value,image = camera.read()
gray = cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
cv2.imshow('image',gray)
if cv2.waitKey(1)& 0xFF == ord('s'):
cv2.imwrite('test.jpg',image)
break
camera.release()
cv2.destroyAllWindows()
```

### Reference and useful links

* [https://community.nxp.com/docs/DOC-331941](https://community.nxp.com/docs/DOC-331941)
* [https://www.udoo.org/forum/threads/using-udoo-camera-with-opencvs-videocapture-class-2-0.6130/#post-23716](https://www.udoo.org/forum/threads/using-udoo-camera-with-opencvs-videocapture-class-2-0.6130/#post-23716) - Thanks to our forum user `Justyn Bell`
* [https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_setup/py_setup_in_fedora/py_setup_in_fedora.html#installing-opencv-from-source](https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_setup/py_setup_in_fedora/py_setup_in_fedora.html#installing-opencv-from-source)
* [https://www.pyimagesearch.com/2015/07/20/install-opencv-3-0-and-python-3-4-on-ubuntu/](https://www.pyimagesearch.com/2015/07/20/install-opencv-3-0-and-python-3-4-on-ubuntu/)
