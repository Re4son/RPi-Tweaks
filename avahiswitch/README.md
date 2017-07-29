# avahiswitch

Raspberry Pi service to turn on avahi-daemon if /boot/avahi is present.  

To be used with ethernet gadget mode to allow to image Sticky Fingers Kali-Pi and enable
ethernet gadget mode by editing the following two files in the /boot partition:  
**_cmdline.txt_**: Add “modules-load=dwc2,g_ether” after “rootwait”  
**_config.txt_**: Add “dtoverlay=dwc2“  

#### To use the Service:
Add a file called "**_avahi_**" in /boot will enable the avahi-daemon, which in turn makes the raspberry pi discoverable via the name "**kali-pi.local**".

This is particularly useful when using ethernet gadget mode for the initial headless setup of a raspberry pi.  
I advise to disable the avahi-daemon service after the initial setup (systemctl disable avahi-daemon).  

#### To install the service:  

*wget -O /lib/systemd/system/avahiswitch.service https://github.com/Re4son/avahiswitch/raw/master/avahiswitch.service*  
*wget -O /etc/avahi/avahi-daemon.conf https://github.com/Re4son/avahiswitch/raw/master/avahi-daemon.conf*  
*systemctl enable avahiswitch.service && systemctl enable avahiswitch.service*  
