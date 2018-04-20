# Création des V-switchs

$nic = Get-NetAdapter

New-VMSwitch -Name "Salle" -NetAdapterName $nic.name -AllowManagementOS

