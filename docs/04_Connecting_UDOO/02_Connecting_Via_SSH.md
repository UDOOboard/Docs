## Overview

Visit our Tutorials section to learn more about: [Connecting Via SSH](/tutorial/connecting-via-ssh/).

SSH is a network communication protocol which can be used for a uber cool functionality: remote shell control.

This basically enables you to remotely operate a device, connected to a network, without direct physical access. If you thought this would be only ultranerd stuff, you might be interested in reading this.

What you need to access your UDOO DUAL/QUAD via a remote shell? First, check that these requirements are satisfied:



* You are connected to the same network that UDOO DUAL/QUAD is. This can be your home router, with UDOO DUAL/QUAD connected via Ethernet cable and your Laptop trough wireless connection

* You don’t have firewalls enabled that could block the communication between the two devices

* Check that the two devices are on the same subnet, if you don’t know what that means, you can just ignore this.


## SSH with Windows

Let’s start. On windows, you need a third party software, called putty.

Download it from <a href="http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe">here</a>

<img class="alignnone size-full wp-image-2483" src="/docs/img/putty1.png" alt="putty1" width="466" height="448" />

Open it and insert UDOO DUAL/QUAD’s IP. If you don’t know which IP your UDOO DUAL/QUAD has, refer to this previous tutorial. Call it UDOO DUAL/QUAD, save it for your future convenience and hit load

<img class="alignnone size-full wp-image-2484" src="/docs/img/putty2.png" alt="putty2" width="466" height="448" />

The very first time you are connecting, you’ll get a security pop-up. Be brave and hit yes.

<img class="alignnone size-full wp-image-2482" src="/docs/img/putty3.png" alt="putty3" width="426" height="304" />

Now, you’ll be prompted with a login box. Just enter user and password and you’re in

<img class="alignnone size-full wp-image-2475" src="/docs/img/putty4.jpg" alt="putty4" width="500" height="314" />

On UDOO DUAL/QUAD’s Ubuntu, user and password are both ubuntu

<img class="alignnone size-full wp-image-2476" src="/docs/img/putty5.jpg" alt="putty5" width="500" height="314" />

Enjoy your new Matrix-like superpower!

## SSH with Mac Os X and Linux

On both these operating system, the procedure is quite the same.
You just need to open a terminal and use the following synthax:

```bash

ssh username@Udoo_Ip

```

<img class="alignnone size-full wp-image-2478" src="/docs/img/sshmacelinux2.jpg" alt="sshmacelinux2" width="500" height="313" />

Then hit enter, bear in mind that the very first time you are doing this, you’ll be prompted with a securty pop-up. To confirm, type “yes".

<img class="alignnone size-full wp-image-2479" src="/docs/img/sshmacelinux3.jpg" alt="sshmacelinux3" width="500" height="313" />

Then type the password and you’re in.

<img class="alignnone size-full wp-image-2480" src="/docs/img/sshmacelinux4.jpg" alt="sshmacelinux4" width="500" height="313" />

Please note: The username and password you are requested to enter while logging via SSH are not pertaining to your Pc, Mac or Linux, they refer to the account you are trying to access on UDOO DUAL/QUAD.
So, if you never changed it, the credentials you need are:

<strong>User</strong>: ubuntu

<strong>Password</strong>: ubuntu

For root access:

<strong>User</strong>: root

<strong>Password</strong>: ubuntu