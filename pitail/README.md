# Pitail

Raspberry Pi services to configure tethering.  

To be used with ethernet gadget mode to allow to image Sticky Fingers Kali-Pi and enable
ethernet gadget mode by editing the following two files in the /boot partition:  
**_cmdline.txt_**: Add “modules-load=dwc2,g_ether” after “rootwait”  
**_config.txt_**: Add “dtoverlay=dwc2“  

#### To configure USB and wifi tethering:
Place your "**_interfaces_**" and "**_wpa_supplicant.conf_**" in /boot.
They will be copied to /etc/network/interfaces and /etc/wpa_supplicant.conf respectively.
The running configs are copied back to /boot/interfaces.active and /boot/wpa_supplicant.active

This is particularly useful when using ethernet gadget mode for the initial headless setup of a raspberry pi.  
I advise to disable the avahi-daemon service after the initial setup (systemctl disable avahi-daemon).  
  
#### To configure Bluetooth tethering:  
Place a "**_pitailbt.cfg_**" file in /boot with a 4 digit bluetooth PIN. Use this pin to pair your smartphone to the pi within 3 minutes of booting up.  
NOTE: Bluetooth pan will not be started if this ile doesn't exist, so if you don't want to pait via bluetooth: delete this file.  
  
#### To install the service:  

*wget -O /lib/systemd/system/pitail.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pitail/pitail.service*  
*wget -O /lib/systemd/system/pitailbt.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pitail/pitailbt.service*  
*wget -O /usr/bin/blueagent5.py https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pitail/blueagent5.py*  
*wget -O /usr/bin/bt-pan https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pitail/bt-pan*  
*systemctl enable pitail.service && systemctl enable pitailbt.service*  
*chmod 755 /usr/bin/bt-pan && chmod 755 /usr/bin/blueagent5.py*  
