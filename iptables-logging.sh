sudo iptables -A INPUT -m limit --limit 15/minute -j LOG --log-level 4 --log-prefix "Dropped by firewall: "
sudo iptables -A FORWARD -m limit --limit 15/minute -j LOG --log-level 4 --log-prefix "Dropped by firewall: "
sudo iptables -A OUTPUT -m limit --limit 15/minute -j LOG --log-level 4 --log-prefix "Dropped by firewall: "
