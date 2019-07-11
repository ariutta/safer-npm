#!/usr/bin/env bash

# sample commands:
# list: sudo iptables -L -v
# drop all: sudo iptables --policy OUTPUT DROP
# notes: https://flyingcircus.io/doc/guide/platform_nixos/firewall.html

iptables --flush

iptables -A OUTPUT -j LOG
iptables -A INPUT -j LOG

# iptables info based on
# https://serverfault.com/a/218800

# Allow loopback
iptables -I INPUT 1 -i lo -j ACCEPT

# Allow DNS
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

# allow connection to npmjs
iptables -A OUTPUT -p tcp -d registry.npmjs.org --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d registry.npmjs.org --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d npmjs.com --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d npmjs.com --dport 443 -j ACCEPT

# allow connection to github
iptables -A OUTPUT -p tcp -d live.github.com --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d live.github.com --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d github.com --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d github.com --dport 443 -j ACCEPT

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Drop everything
iptables -P INPUT DROP
iptables -P OUTPUT DROP
