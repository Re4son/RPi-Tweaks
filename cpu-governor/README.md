# cpu-governor

Raspberry Pi service to switch to ondemand cpu governor (unless shift key is pressed) during boot up.  

#### To install the service:  

*apt install triggerhappy*  
*wget -O /etc/init.d/cpu-governor https://github.com/Re4son/RPi-Tweaks/raw/master/cpu-governor/cpu-governor*  
*chmod +x /etc/init.d/cpu-governor*  
*wget -O /lib/systemd/system/cpu-govenor.service https://github.com/Re4son/RPi-Tweaks/raw/master/cpu-governor/cpu-governor.service*  
*systemctl enable cpu-govenor && systemctl start cpu-governor*  

#### Work in progress:  

I'll write a tool similar to raspi-config, which can be used to change the cpu governor parameters  
