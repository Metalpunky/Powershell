# Ce script permet de creer un client CLI-02
#

$NomVM = "CLI-02"

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
    
Set-VM -Name $NomVM -ProcessorCount 2 -DynamicMemory
