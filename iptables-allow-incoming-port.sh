if [ -z "$1" ]; then interface=eth0; else interface=$1; fi;
iptables -A INPUT  -i $interface -p tcp --dport $1 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $interface -p tcp --sport $1 -m state --state ESTABLISHED     -j ACCEPT


