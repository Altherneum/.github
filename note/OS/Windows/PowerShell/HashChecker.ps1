[String]$Hash = Read-Host "Entrez le Hash SHA256 à vérifier"
[String]$Path = Read-Host "Entrez le chemin du fichier à vérifier"
[String]$HashType = Read-Host "Entrez le type de Hash (Exemple SHA256)"
Write-Host "La commande suivante va être lancée :    Get-FileHash $Path -Algorithm $HashType | Select-Object -ExpandProperty 'Hash'    ..."
[String]$Hashed = Get-FileHash $Path -Algorithm $HashType | Select-Object -ExpandProperty 'Hash'
if($Hash -eq $Hashed){
    Write-Host "Le Hash est identique"
}
else {
    Write-Host "Le Hash n'est pas identique"
}