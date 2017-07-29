# vncservice
Service file to start TightVNC or TigerVNC as a service in kali


#### To install and enable the service:  

*sudo wget -O /lib/systemd/system/vncserver@.service https://github.com/Re4son/vncservice/raw/master/vncserver@.service*  
*sudo systemctl enable vncserver@1.service && sudo systemctl start vncserver@1.service*  
  
This service runs vncserver as root. You can change that and other startup parameters by editing /lib/systemd/system/vncserver@.service

#### Important Notice:

The VNC server restricts connections from the localhost only for security reasons. To connect to the vnc server over the network use an ssh tunnel:
Assuming your vnc server runs on 192.168.137.137, type this on your remote client:

ssh -L 5902:localhost:5901 root@192.168.137.137  
vncviewer 127.0.0.1::5902

Since you are ssh'ing into your remote machine, you might as well just type "vncserver" and be done instead of running it as a service.


# xfce-vnc-startup
Xstartup file to allow multiple simultanious xfce sessions (fix for "xfce4-session: Another session manager is already running" error)

#### Installation
wget -O ~/.vnc/xstartup https://github.com/Re4son/vncservice/raw/master/xstartup  
chmod 755 ~/.vnc/xstartup

![xfce4_sessions](https://whitedome.com.au/re4son/wp-content/uploads/VNC-multipleSessions.jpg)

