### BEGIN INIT INFO
# Provides:          ManaSimple
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Control hostapd access point
# Description:       Control hostapd access point Services
### END INIT INFO

phy=wlan0
export MENUDIR="/opt/Kali-Pi/Menus/"

start() {
        echo "--------------------------------"
        echo "   START Remote Access WiFi AP"
        echo "--------------------------------"


        if [ -f /usr/bin/nexutil ]; then
            cd /usr/local/src/re4son-kernel_4*/
            ./install.sh -p
            cd -
        fi
        if [ -f /var/lib/misc/dnsmasq.leases ]; then
            rm /var/lib/misc/dnsmasq.leases
        fi

        upstream=lo
        conf=$MENUDIR/RAS-AP/ras-ap.conf
        hostapd=/usr/sbin/hostapd

        service network-manager stop
        rfkill unblock wlan



        ip link set dev $phy up

        sed -i "s/^interface=.*$/interface=$phy/" $conf
        $hostapd $conf&
        sleep 5
        ip addr add 192.168.40.1/24 dev $phy
        route add -net 192.168.40.0 netmask 255.255.255.0 gw 192.168.40.1

        dnsmasq -z -C $MENUDIR/RAS-AP/dnsmasq-dhcpd.conf -i $phy -I lo

##        #Enable NAT
##        echo '1' > /proc/sys/net/ipv4/ip_forward
##        iptables --policy INPUT ACCEPT
##        iptables --policy FORWARD ACCEPT
##        iptables --policy OUTPUT ACCEPT
##        iptables -F
##        iptables -t nat -F
##        iptables -t nat -A POSTROUTING -o $upstream -j MASQUERADE
##        iptables -A FORWARD -i $phy -o $upstream -j ACCEPT

}

stop() {

        echo "---------------------------------------"
        echo "   STOP Remote Access Wifi-AP SERVICES "
        echo "---------------------------------------"
        pkill dnsmasq
        pkill hostapd
        pkill python
        ip addr del 192.168.40.1/24 dev $phy

}

case "$1" in
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
        stop
        start
        ;;
    force-reload)
        ;;
    status)
        PID=$(ps auxww | grep "[r]as-ap.conf" | awk '{print $2}')
        if test ${PID:-0} -gt 0
        then
            echo "RAS-AP is running."
            return 1
        else
            echo "RAS-AP is not running."
            return 0
        fi
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac
