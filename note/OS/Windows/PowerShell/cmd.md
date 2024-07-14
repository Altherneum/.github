# Commandes
## Read & Write host
- `$motDePasse = Read-Host "Entre le mot de passe"`
- `Write-Host "Vous avez entré : $motDePasse"`

## File type
- `System.IO.DirectoryInfo`
- `System.IO.FileAttributes`
- `System.IO.FileInfo`

## Date
- `System.DateTime`
- `[datetime]::now`

## Generic Measure Info
- `Microsoft.PowerShell.Commands.GenericMeasureInfo`
- `Microsoft.PowerShell.Commands.TextMeasureInfo`

## Win Event 
- `Get-WinEvent -LogName System -MaxEvents 5` Affiche les 5 derniers logs système
- `Get-WinEvent -LogName System -Newest 1`
- `Get-WinEvent -LogName System -MaxEvents 10 | Format-Table -AutoSize -Wrap`
- `Get-WinEvent -LogName System | Where-Object {$_.TimeCreated -like "*10/07/2024*"}`