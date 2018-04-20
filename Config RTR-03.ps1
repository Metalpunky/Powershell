#Renommage Windows:

Rename-computer -NewName "RTR-03"


#Il faut rennomer les cartes réseaux avant de faire la suite

# Configurer IP Interface

netsh interface ipv4 set address "WAN" source=static 192.168.255.254/24

# Configurer serveur DNS

netsh interface ipv4 set dnsservers "WAN" source=static 192.168.8.1 validate=no

#Activation forwarding

Netsh interface ipv4 set interface "WAN" forwarding=enabled

#Ajout des routes
    #Arcueil
	route add -p 192.168.8.0/21 192.168.255.8
    #Boulogne
	route add -p 192.168.128.0/24 192.168.255.128

