if [ -z "$1" ]; then interface=eth0; else interface=$1; fi;
iptables -A OUTPUT -o $interface -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT  -i $interface -p tcp --sport 22 -m state --state ESTABLISHED     -j ACCEPT
