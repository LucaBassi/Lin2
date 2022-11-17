#!/bin/bash

apt install iptables -y

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -o ens33 -j MASQUERADE
iptables -A INPUT -i ens36 -j ACCEPT
iptables -A INPUT -i ens36 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -j ACCEPT

systemctl restart networking.service

echo '1' | sudo tee /proc/sys/net/ipv4/conf/ens33/forwarding
echo '1' | sudo tee /proc/sys/net/ipv4/conf/ens36/forwarding

iptables -t nat -A PREROUTING -p tcp -i ens33 --dport 8081 -j DNAT --to-destination 192.168.50.10:80
iptables -A FORWARD -p tcp -d 192.168.50.10 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A PREROUTING -p tcp -i ens33 --dport 8082 -j DNAT --to-destination 192.168.50.20:80
iptables -A FORWARD -p tcp -d 192.168.50.10 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


systemctl restart networking.service