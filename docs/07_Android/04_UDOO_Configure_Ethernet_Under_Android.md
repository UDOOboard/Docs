To configure Ethernet connection on UDOO DUAL/QUAD under Android 4.3 you need to connect the board to a host computer. You need to plug a microUSB cable to i.MX6 debug serial UART on CN6 microUSB port. With a serial monitor it's possible to communicate with Android shell over serial uart.

## DHCP

When you connect the Ethernet cable the DHCP mode is selected by default.

## Static Address

To configure a static ip address you need to open the i.MX6 debug console. Use the following command to set a static ip and a subnet mask:

```bash

ifconfig eth0 [YOUR_IP_ADDRESS] netmask [NETMASK]

```

Then configure the gateway ip using this command:

```bash

ip route add default via [GATEWAY_IP] dev eth0

```

## DNS

To set different DNS you need to change the environment properties:

```bash

setprop net.dns1 [PRIMARY_DNS_IP_ADDRESS]
setprop net.dns2 [SECONDARY_DNS_IP_ADDRESS]

```




