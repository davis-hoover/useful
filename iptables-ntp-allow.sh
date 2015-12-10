iptables -A OUTPUT -o eth0 -p udp --dport 123 -m state --state NEW,ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i eth0 -p udp --sport 123 -m state --state ESTABLISHED         -j ACCEPT
