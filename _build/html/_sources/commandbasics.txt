###############################
Linux Command Line Basics
###############################


This will help you move your first steps in the command shell environment and represent a sum of the most basic shell commands::

  
**sudo**

Your first ally, allows users to run programs with the security privileges of root, or superuser.Its name is a 
concatenation of “su” (substitute user) and “do”, or take action . So, if you get an error message saying that “only root 
can do that”, just use the same command with preceeded by sudo::

  sudo

**sudo su**

This just enables root privileges once for all, without forcing you to type sudo everytime. It works until you close 
the shell you are working into:: 

  sudo su

**touch**

create an empty file:: 

  touch
  
  
**nano**

open an handy text editor, to save and exit, press “ctrl” and “x”, and tell yes or no by pressing “y” or “n” :: 

nano


**cat**

cat shows the content of a file, it speeds up file inspection for smaller files::

  cat /etc/hostname


**ls**

Shows you the content of a folder::

  ls

**cd**

opens a specific folder::

  cd /home
  cd ubuntu
  
**cd ..**

Brings you to a higher folder level::

  cd /home/ubuntu
  cd .. (/home)

**cd /**

brings you to root (top filesystem level)::

  cd /


**rm**

deletes a file::

  rm myfile.my

**rm -rf**

deletes a folder::


  rm -rf /home/ubuntu/myfolder
  rm -rf myfolder


**mv**

moves a file or a folder. Useful for renaming also::

  mv myfile /myfolder/myfile
  mv myfile mysecondfile

**cp**

copies a file::

  cp myfile /home/ubuntu/

**cp -R**

copies a folder::

  cp -R myfolder /home/ubuntu/myfolder

**mkdir**

creates a folder::

  mkdir myfolder


**top**

Top is a very useful utility, it basically gives you a complete overview of the system’s status. It produces an ordered 
list of running processes selected by user-specified criteria. Top shows how much processing power and memory are being
used, as well as other information about the running processes::

  top

**df -h**

Shows used and available disk space, in megabytes::

  df -h
  
**ifconfig -a**

Shows networking useful data, like current ip, netmasks and other statistics::

  ifconfig -a
  
**chmod**

chmod let you set files permissions. This utility is very important for people concerned about security, but it is 
useful also for coders, since you can set a script as executable with it .


**dmesg**

Shows the messages resulting from the most recent system boot. It is useful for troubleshooting, since you can see
which modules are loaded, which binaries are started and so on.


**sync**

Thanks to this command your SD card lifespan will drastically improve, remember to launch it every time you turn Udoo 
off, or remove the power. Completes all pending input/output operations. It must be launched as root, or with sudo.

**reboot**

reboots the system


**shutdown**

shuts it down::

  shutdown now

