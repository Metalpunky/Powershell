#Renommage Windows:

Rename-computer -NewName "RTR-01"

#!! Il faut rennomer les cartes réseaux avant la suite !!

# Configurer IP Interface

netsh interface ipv4 set address "ARC-SRV" source=static 192.168.8.254/24
netsh interface ipv4 set address "ARC-CLI" source=static 192.168.12.254/24
netsh interface ipv4 set address "WAN" source=static 192.168.255.8/24

# Configurer serveur DNS

netsh interface ipv4 set dnsservers "ARC-SRV" source=static 192.168.8.1 validate=no
netsh interface ipv4 set dnsservers "ARC-CLI" source=static 192.168.8.1 validate=no
netsh interface ipv4 set dnsservers "WAN" source=static 192.168.8.1 validate=no

#Activation forwarding

Netsh interface ipv4 set interface "ARC-CLI" forwarding=enabled
Netsh interface ipv4 set interface "ARC-SRV" forwarding=enabled
Netsh interface ipv4 set interface "WAN" forwarding=enabled

#Ajout des routes

route add -p 192.168.128.0/24 192.168.255.128
route add -p 0.0.0.0/0 192.168.255.254



