$NomVM = Read-Host = "Nom de la VM ?"
$NbreCartes = Read-Host = "Nombre de cartes réseaux ?"

#Compteur
$CountNetadapter = 1

if ($NbreCartes -gt 1) 

{ do 
    
    {Add-VMNetworkAdapter -VMName $NomVM
    $CountNetadapter++
    } until ($NbreCartes -eq $CountNetadapter)}
   
   Else {Write-Host "Assez de cartes réseaux existantes"}
