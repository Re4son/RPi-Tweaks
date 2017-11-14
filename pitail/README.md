# avahiswitch

Raspberry Pi service to copy across /boot/interfaces and /boot/wpa_supplicant.conf is present.  

To be used with ethernet gadget mode to allow to image Sticky Fingers Kali-Pi and enable
ethernet gadget mode by editing the following two files in the /boot partition:  
**_cmdline.txt_**: Add “modules-load=dwc2,g_ether” after “rootwait”  
**_config.txt_**: Add “dtoverlay=dwc2“  

#### To use the Service:
Place your "**_interfaces_**" and "**_wpa_supplicant.conf_**" in /boot.
They will be copied to /etc/network/interfaces and /etc/wpa_supplicant.conf respectively.
The running configs are copied back to /boot/interfaces.active and /boot/wpa_supplicant.active

This is particularly useful when using ethernet gadget mode for the initial headless setup of a raspberry pi.  
I advise to disable the avahi-daemon service after the initial setup (systemctl disable avahi-daemon).  

#### To install the service:  

*wget -O /lib/systemd/system/pitail.service https://raw.githubusercontent.com/Re4son/RPi-Tweaks/master/pitail/pitail.service*  
*systemctl enable pitail.service && systemctl enable pitail.service*  
