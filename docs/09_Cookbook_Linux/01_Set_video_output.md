## Set video output to HDMI
Open a terminal and run this command as super user:

    sudo udooscreenctl set hdmi


## Set video output to LVDS 7-inches panel
Open a terminal and run this command as super user:

    sudo udooscreenctl set lvds7

## Set video output to LVDS 15-inches panel
Open a terminal and run this command as super user:

    sudo udooscreenctl set lvds15

## Set as headless device (disable video output)
This is useful to disable the HDMI chip, saving power. Open a terminal and run this command as super user:

    sudo udooscreenctl set headless


## Get current output
Open a terminal and run this command as super user:

    sudo udooscreenctl get

to get current output device. Possible outputs are:
- `hdmi`
- `lvds7`
- `lvds15`
- `headless`
