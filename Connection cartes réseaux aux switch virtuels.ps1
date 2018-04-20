# Faire attention aux labels des v-switch


Get-VMNetworkAdapter rtr-03 | Connect-VMNetworkAdapter -SwitchName "Salle"


Get-VMNetworkAdapter * | Where-Object {$_.ipaddresses -like "192.168.255.*"} | Connect-VMNetworkAdapter -SwitchName WAN
Get-VMNetworkAdapter * | Where-Object {$_.ipaddresses -like "192.168.8.*"} | Connect-VMNetworkAdapter -SwitchName ARC-SRV
Get-VMNetworkAdapter * | Where-Object {$_.ipaddresses -like "192.168.12.*"} | Connect-VMNetworkAdapter -SwitchName ARC-SRV
Get-VMNetworkAdapter * | Where-Object {$_.ipaddresses -like "192.168.128.*"} | Connect-VMNetworkAdapter -SwitchName BOU-LAN

Connect-VMNetworkAdapter -VMName "cli-01" -SwitchName ARC-CLI
Connect-VMNetworkAdapter -VMName "cli-02" -SwitchName ARC-CLI
Connect-VMNetworkAdapter -VMName "cli-03" -SwitchName BOU-LAN

Rename-VMNetworkAdapter -VMName "Cli-01" -NewName "ARC-CLI"
Rename-VMNetworkAdapter -VMName "Cli-02" -NewName "ARC-CLI"
Rename-VMNetworkAdapter -VMName "Cli-03" -NewName "BOU-LAN"

Get-VMNetworkAdapter *


