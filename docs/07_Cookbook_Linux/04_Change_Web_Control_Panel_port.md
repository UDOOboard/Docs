If you want to install a webserver, in order to avoid port conflicts, you need to change the port used by the Web Control Panel.

## Using the Web Control Panel

You can change the port using the GUI provided by the [Web Control Panel](../Basic_Setup/Web_Control_Panel.html) itself, in *Configuration*/*Advanced settings*.

Reboot your board to apply the settings.

## Using the terminal/SSH

To change the default port, run in a terminal:

     echo 8080 | sudo tee /etc/udoo-web-conf/port

If you want to disable the tool completely, run

     echo manual | sudo tee /etc/init/udoo-web-conf.override

Enable it again removing the override file:

     sudo rm /etc/init/udoo-web-conf.override
     