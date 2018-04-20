# Ce script permet de creer un serveur Windows SRV-02
#

$NomVM = "SRV-02"

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
    