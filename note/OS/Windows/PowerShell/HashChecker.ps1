$Hash = Read-Host "Entrez le Hash SHA256 à vérifier : "
$Path = Read-Host "Entrez le chemin du fichier à vérifier : "
$HashType = Read-Host "Entrez le type de Hash (Exemple SHA256) : "
$Hashed = Get-FileHash $Path -Algorithm $HashType | Select-Object -ExpandProperty "Hash"
if($Hash -eq $Hashed){
    Write-Host "🟢 Le Hash est identique ✅"
}
else {
    Write-Host "🛑 Le Hash n'est pas identique ❌"
}