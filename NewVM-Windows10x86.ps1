# Ce script permet de creer un client Windows 10x86 et son disque
#

# Demande à l'utilisateur le nom de la VM a creer
$NomVM = Read-Host = "Nom de la VM Client Windows 10x86 ?"

# Parametres communs à toutes les VMs
$BaseVM = "D:\Masters\Master_10_x86_Fr_v1.vhdx"
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
    