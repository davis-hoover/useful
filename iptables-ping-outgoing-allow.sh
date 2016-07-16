if [ -z "$1" ]; then interface=eth0; else interface=$1; fi;
iptables -A OUTPUT -o $interface -p icmp --icmp-type echo-request -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT  -i $interface -p icmp --icmp-type echo-reply -m state --state ESTABLISHED     -j ACCEPT
