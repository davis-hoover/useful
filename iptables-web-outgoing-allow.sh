if [ -z "$1" ]; then interface=eth0; else interface=$1; fi;

iptables -A OUTPUT -o $interface -p tcp --dport 80  -m state --state NEW,ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i $interface -p tcp --sport 80  -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $interface -p udp --dport 80  -m state --state NEW,ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i $interface -p udp --sport 80  -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $interface -p tcp --dport 443 -m state --state NEW,ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i $interface -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $interface -p udp --dport 443 -m state --state NEW,ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i $interface -p udp --sport 443 -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT  -i $interface -p tcp --sport 53  -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $interface -p tcp --dport 53  -m state --state NEW,ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i $interface -p udp --sport 53  -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $interface -p udp --dport 53  -m state --state NEW,ESTABLISHED     -j ACCEPT
