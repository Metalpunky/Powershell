# Ce script permet de creer un serveur Windows Server 2016 et son disque
#

# Demande à l'utilisateur le nom de la VM a creer
$NomVM = Read-Host = "Nom de la VM Serveur WS2016 GUI ?"

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
    