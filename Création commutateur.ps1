# Demande à l'utilisateur le nom du commutateur virtuel à créer
$NomVMSwitch = Read-Host = "Nom du commutateur virtuel à créer ?"

#Demande à l'utilisateur le type de commutateur
$TypeVMSwitch = Read-Host = "Type de commutateur ?"


New-VMSwitch -Name $NomVMSwitch -SwitchType $TypeVMSwitch
