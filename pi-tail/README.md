# Pi-Tail

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
Place a "**_pi-tailbt.conf_**" file in /boot with mac addresses of authorised devices. Pair to the Pi-Tail the pi within 3 minutes of booting up.  
NOTE: Bluetooth pan will not be started if this ile doesn't exist, so if you don't want to pair via bluetooth: delete this file.  
  
#### To install the service:  

*wget -O /etc/systemd/system/pi-tail.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/pi-tail.service*  
*wget -O /etc/systemd/system/pi-tailbt.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/pi-tailbt.service*  
*wget -O /etc/systemd/system/pi-tailms.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/pi-tailms.service*  
*wget -O /etc/systemd/system/pi-tailap.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/pi-tailap.services*  
*wget -O /etc/systemd/network/pan0.network https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/pan0.network*  
*wget -O /etc/systemd/system/bt-agent.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/bt-agent.service*  
*wget -O /etc/systemd/system/bt-network.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/bt-network.service*  
*wget -O /lib/systemd/system/hciuart.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/hciuart.service*  
*wget -O /boot/cmdline.txt https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/cmdline.storage*  
*wget -O /boot/cmdline.storage https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/cmdline.storage*  
*wget -O /boot/cmdline.eth https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/cmdline.eth*  
*wget -O /boot/interfaces https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/interfaces*  
*wget -O /boot/interfaces.example.wifi https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/interfaces.example.wifi*  
*wget -O /boot/interfaces.example.wifi-AP https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/interfaces.example.wifi-AP*  
*wget -O /boot/pi-tailbt.example https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/pi-tailbt.example*  
*wget -O /boot/wpa_supplicant.conf https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/wpa_supplicant.conf*  
*wget -O /boot/Pi-Tail.README https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/Pi-Tail.README*  
*wget -O /boot/Pi-Tail.HOWTO https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/Pi-Tail.HOWTO*  
*wget -O /boot/config.txt https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/config.txt*  
*wget -O /etc/udev/rules.d/70-persistent-net.rules https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/70-persistent-net.rules*  
*wget -O /opt/Kali-Pi/Menus/RAS-AP/dnsmasq-dhcpd.conf https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/dnsmasq-dhcpd.conf*  
*wget -O /opt/Kali-Pi/Menus/RAS-AP/ras-ap.sh https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/ras-ap.sh*  
*wget -O /opt/Kali-Pi/Menus/RAS-AP/ras-ap.conf https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pi-tail/ras-ap.conf*  
*systemctl enable pi-tail.service && systemctl enable pi-tailbt.service && systemctl enable pi-tailms.service && systemctl enable pi-tailap.service && systemctl enable systemd-networkd && systemctl enable bt-agent && systemctl enable bt-network
*  
