#Renommage Windows:

Rename-computer -NewName "RTR-02"


#Il faut rennomer les cartes réseaux avant de faire la suite

# Configurer IP Interface

netsh interface ipv4 set address "Bou-lan" source=static 192.168.128.254/24
netsh interface ipv4 set address "WAN" source=static 192.168.255.128/24

# Configurer serveur DNS

netsh interface ipv4 set dnsservers "Bou-lan" source=static 192.168.8.1 validate=no
netsh interface ipv4 set dnsservers "WAN" source=static 192.168.8.1 validate=no

#Activation forwarding

Netsh interface ipv4 set interface "Bou-lan" forwarding=enabled
Netsh interface ipv4 set interface "WAN" forwarding=enabled

#Ajout des routes

	route add -p 192.168.8.0/21 192.168.255.8
	route add -p 0.0.0.0/0 192.168.255.254



