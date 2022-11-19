#!/bin/bash

apt install iptables -y
apt install iptables-persistent -y
sudo apt install nginx -y
sudo apt install apache2 -y

#echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -o ens33 -j MASQUERADE
iptables -A INPUT -i ens36 -j ACCEPT
iptables -A INPUT -i ens36 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -j ACCEPT

#echo '1' | sudo tee /proc/sys/net/ipv4/conf/ens33/forwarding
#echo '1' | sudo tee /proc/sys/net/ipv4/conf/ens36/forwarding
#
#iptables -t nat -A PREROUTING -p tcp -i ens33 --dport 8081 -j DNAT --to-destination 192.168.50.10:80
#iptables -A FORWARD -p tcp -d 192.168.50.10 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
#
#iptables -t nat -A PREROUTING -p tcp -i ens33 --dport 8082 -j DNAT --to-destination 192.168.50.20:80
#iptables -A FORWARD -p tcp -d 192.168.50.10 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


systemctl restart networking.service

iptables-save | tee /etc/iptables/rules.v4


http_upgrade_var='$http_upgrade'
host_var='$host'

default="/etc/nginx/sites-available/default"
cat <<EOM >>$default
server {
    listen 80;
    listen [::]:80;
    server_name lin2-srv1 ;
        location / {
        proxy_pass http://192.168.50.10:80;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade_var;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host_var;
        proxy_cache_bypass $http_upgrade_var;
    }
}
server {
    listen 80;
    listen [::]:80;
    server_name lin2-srv2 ;
        location / {
        proxy_pass http://192.168.50.20:80;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade_var;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host_var;
        proxy_cache_bypass $http_upgrade_var;
    }
}
EOM