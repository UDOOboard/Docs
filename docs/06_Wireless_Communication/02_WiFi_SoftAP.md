Newer builds of UDOObuntu are supporting the software access-point mode for the WL1831 chip.

In order to enable SoftAP mode, install the `udoo-softap` metapackage:

    sudo apt-get install udoo-softap

Doing this, a default `/etc/hostapd/hostapd.conf` will be provided. Edit this file to change the access point settings:

```
interface=wlan0           
driver=nl80211            
hw_mode=g                 
macaddr_acl=0             
auth_algs=1               
ignore_broadcast_ssid=0   
ieee80211n=1              

ssid=UDOO hotspot       
channel=1               
wpa=2                   
wpa_key_mgmt=WPA-PSK    
rsn_pairwise=CCMP       
wpa_passphrase=udooboard
```

You should change:

 * `ssid` is the name of the network;
 * `channel` is the frequency channel (it is better to pick the channel least congested);
 * `wpa_passphrase` is the password to connect to the network.

In `/etc/default/hostapd` be sure that `DAEMON_CONF` is uncommented and pointed to the hostapd.conf path:

    DAEMON_CONF="/etc/hostapd/hostapd.conf"


<span class="label label-warning">Heads up!</span> When in Soft-AP mode, you cannot connect to wireless networks in client mode! In fact, installing `udoo-softap` you are disabling the `wpa_supplicant` service. Uninstall the Soft-AP metapackage to restore client Wi-Fi connectivity.
