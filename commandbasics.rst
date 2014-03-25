###############################
Linux Command Line Basics
###############################


Linux Command Line Interface, (CLI from now on) could be at first glance discouraging for the average Joe, since nowadays
we are only used to Graphic Interfaces. But don’t let you down, using a command line shell could be, not only very useful,
but also kind of funny.
This Tutorial will help you move your first steps in the command shell environment.

First, when a Command Line Interface could be useful for you?
Remote Connection via SSH: SSH remote connection allows to interact with Udoo without physical access to it. SSH is 
available only with command line interface.
Using a minimal Linux Distribution without a graphical interface. Some Linux Distribution come without a Graphical User 
Interface, in order to maximize available resources. Command line interface is your only bet in this scenario
Some power-users consider CLI the most convenient way to perform code execution and file-system operations. Even if you 
are not in this category, you may found out that CLI can be very fast when you get used to it.
Showing up with your mates, the longest your CLI strings, the more rep you’ll get.
So, let’s start this adventure with the very basic Linux commands:

sudo

Your first ally, allows users to run programs with the security privileges of root, or superuser.Its name is a 
concatenation of “su” (substitute user) and “do”, or take action . So, if you get an error message saying that “only root 
can do that”, just use the same command with preceeded by sudo.

sudo

sudo su

This just enables root privileges once for all, without forcing you to type sudo everytime. It works until you close 
the shell you are working into.
1
sudo su
touch

create an empty file
1
touch
nano

open an handy text editor, to save and exit, press “ctrl” and “x”, and tell yes or no by pressing “y” or “n”
1
nano
cat

cat shows the content of a file, it speeds up file inspection for smaller files.
1
cat /etc/hostname
ls

Shows you the content of a folder
1
ls
cd

opens a specific folder
1
2
cd /home
cd ubuntu
cd ..

Brings you to a higher folder level
1
2
cd /home/ubuntu
cd .. (/home)
cd /

brings you to root (top filesystem level)
1
cd /
rm

deletes a file
1
rm myfile.my
rm -rf

deletes a folder
1
2
rm -rf /home/ubuntu/myfolder
rm -rf myfolder
mv

moves a file or a folder. Useful for renaming also
1
2
mv myfile /myfolder/myfile
mv myfile mysecondfile
cp

copies a file
1
cp myfile /home/ubuntu/
cp -R

copies a folder
1
cp -R myfolder /home/ubuntu/myfolder
mkdir

creates a folder
1
mkdir myfolder
top

Top is a very useful utility, it basically gives you a complete overview of the system’s status. It produces an ordered 
list of running processes selected by user-specified criteria. Top shows how much processing power and memory are being
used, as well as other information about the running processes.
1
top
df -h

Shows used and available disk space, in megabytes.
1
df -h
ifconfig -a

Shows networking useful data, like current ip, netmasks and other statistics.
1
ifconfig -a
chmod

chmod let you set files permissions. This utility is very important for people concerned about security, but it is 
useful also for coders, since you can set a script as executable with it .
For a more comprehensive guide on how to use chmod see here
dmesg

Shows the messages resulting from the most recent system boot. It is useful for troubleshooting, since you can see
which modules are loaded, which binaries are started and so on.
1
dmesg
sync

Thanks to this command your SD card lifespan will drastically improve, remember to launch it every time you turn Udoo 
off, or remove the power. Completes all pending input/output operations. It must be launched as root, or with sudo.
1
sync
reboot

reboots the system
1
reboot
shutdown

shuts it down
1
shutdown now

