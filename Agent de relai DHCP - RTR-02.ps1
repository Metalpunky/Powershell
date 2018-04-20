#Installation de la fonctionnalité
Install-WindowsFeature routing -IncludeManagementTools

#IL FAUT REDEMARRER AVANT DE PASSER A LA SUITE

# Mise en mode auto du service RemoteAccess
set-service -name RemoteAccess -startuptype automatic

#Lancement du service
Start-Service RemoteAccess

#
netsh routing ip add interface name = "Bou-lan" enable
netsh routing ip set interface arc-cli enable
netsh routing ip relay add interface "Bou-lan"
#REDEMARRER
netsh routing ip relay install
netsh routing ip relay set interface name = "Bou-lan" enable
netsh routing ip relay add dhcpserver 192.168.8.1

