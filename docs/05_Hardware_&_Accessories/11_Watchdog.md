A watchdog timer (also called WDT, sometimes called a computer operating properly, a COP timer, or simply a watchdog) is an electronic timer used to detect and recover from computer malfunctions. During normal operations, the computer regularly restarts the watchdog timer to prevent it from elapsing, or "timing out". If, due to a hardware fault or program error, the computer fails to restart the watchdog, the timer will elapse and generate a timeout signal. The timeout signal is used to initiate corrective action or actions. The corrective actions typically include placing the computer system in a safe state and restoring normal system operation. You can use the watchdog to provide hardware stability control to your projects.

To enable Watchdog function you need to export two GPIOs. You should run these commands as root user:
```
sudo su
```

Enter root password.
Export the two GPIOs.

```
echo 132 > /sys/class/gpio/export && echo 83 > /sys/class/gpio/export
gpio132 ---> WDT_EN ---> Enable/disable Watchdog (LOW => ENABLE)
gpio83  ---> WDT_TR ---> Trigger signal
```

Set the WDT_EN signal as output with high value. This signal enable Watchdog when it's LOW.
```
echo out > /sys/class/gpio/gpio132/direction && echo 1 > /sys/class/gpio/gpio132/value
```

Now you should create and launch some task that generates a trigger sequence command. This C program generates an impulse sequence at 5Hz (each pulse is 0.2 second long).
Open a terminal, create and open a file named, for example, wdoggy.c:
```
nano wdoggy.c
```

Copy this content inside the file:
```
#include<stdlib.h>
#include<stdio.h>
```
```
int main(void){
   
   printf("UDOO Watchdog trigger example running ...");
   system( "echo out > /sys/class/gpio/gpio83/direction" );
   
   for(;;) {
       system( "echo 0 > /sys/class/gpio/gpio83/value" );
       usleep(100000);
       system( "echo 1 > /sys/class/gpio/gpio83/value" );
       usleep(100000);
   } 
}
```
Save the file, and compile it:
```
gcc wdoggy.c -o wdoggy
```
Then run it:
```
./wdoggy
```
If you try to stop the process, after one second the board reboots automatically.

So if you need a watchdog function in your application you need to enable the Watchdog and provide a service that pings the WDT_TR more then once per second.
