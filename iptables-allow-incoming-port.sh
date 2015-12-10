iptables -A INPUT  -i eth0 -p tcp --dport $1 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport $1 -m state --state ESTABLISHED     -j ACCEPT


