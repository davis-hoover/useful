iptables -A INPUT  -i eth0 -p tcp --dport 80  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 80  -m state --state ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i eth0 -p udp --dport 80  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 80  -m state --state ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 443 -m state --state ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i eth0 -p udp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 443 -m state --state ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i eth0 -p tcp --sport 53  -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 53  -m state --state NEW,ESTABLISHED     -j ACCEPT
iptables -A INPUT  -i eth0 -p udp --sport 53  -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --dport 53  -m state --state NEW,ESTABLISHED     -j ACCEPT