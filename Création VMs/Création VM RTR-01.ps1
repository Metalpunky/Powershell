# Ce script permet de creer le RTR-01
#

# Demande à l'utilisateur le nom de la VM a creer
$NomVM = "RTR-01"

# Parametres communs à toutes les VMs
$BaseVM = "D:\Masters\Master_2016_v1.vhdx"
$DiskVM = "D:\Hyper-V\VirtualDisks\" + $NomVM +".vhdx"
$MemVM = 1gb
 

# Creation du disque de diff
New-VHD `
    -Differencing `
    -Path $DiskVM `
    -ParentPath $BaseVM

# Creation de la VM
New-VM `
    -Name $NomVM `
    -MemoryStartupBytes $MemVM `
    -VHDPath $DiskVM `

# Configuration 

Set-VM -Name $NomVM -DynamicMemory 

#Ajout cartes réseaux:

Remove-VMNetworkAdapter -Name "Carte réseau" -VMName $NomVM

Add-VMNetworkAdapter -VMName $NomVM -Name ARC-SRV
Add-VMNetworkAdapter -VMName $NomVM -Name ARC-CLI
Add-VMNetworkAdapter -VMName $NomVM -Name WAN

