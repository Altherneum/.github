# PowerShell
## Caractères spéciaux
### Point virgule
- `;` Permet de faire plusieurs commandes à la suite sur la même ligne  
`Write-Host "Entrez le SafeModeAdministratorPassword" ; $pass=Read-Host -AsSecureString`

### Pipe
- `|` Pipe sert à faire plusieurs commandes à la suite avec le résultat (output) de la précédente  
`Get-Process | Where-Object { $_.CPU -gt 10 } | Select-Object -First 5`

#### Exemples de pipe
- `Get-SmbShare | Where name -like "*C*"` Affiche les partages contenant \*C\* dans leurs noms
- `Get-Service | Format-Table name,status` Affiche que le status et name des services

#### Exemples de pipe avec Where
- `Get-Service | Where name -like "*xbox*"` Affiche les services avec Xbox dans leurs noms
  - `Get-Service | Where-Object name -like "*xbox*"` L'alias de `Where` est aussi `Where-Object`
  - `Get-Service | ? name -like "*xbox*"` L'alias de `Where` est aussi `?`
  - `Get-Service | Where-Object name -eq "XboxNetApiSvc"` Affiche le service 
  - `Get-Service | Where-Object {$_.name -like "*xbox*"}` Avec des `{}`
  - `Get-Service | Where-Object name -like "*xbox*" | Where-Object name -eq "XboxNetApiSvc"` Double pipe

#### Autres exemples de pipe
- `Get-Service | Get-Member` Affiche les propriétés des objets via `Get-Member`
- `Get-PhysicalDisk | Where-Object -FilterScript { $PSItem.HealthStatus -eq "Healthy" } | Select-Object -Property FriendlyName,OperationalStatus,DriveLetter,FileSystemLabel,DriveType,FileSystem | Format-Table` Récupère les disques, puis uniquement ceux "Healthy", puis récupère uniquement certaines catégories, puis fait un formatage en tableau

### Backtick
- `` ` `` Le backtick sert à diviser les commandes en plusieurs lignes
```
Get-Process `
| Where-Object { $_.CPU -gt 10 } `
| Select-Object -First 5
```

## Commentaires
- Commentaire `# Text à commenter` 
- Commentaire multi ligne
```
<#
Text à commenter
#>
```

## Commandes
### Help
- `Get-Help [COMMANDE]` Affiche l'aide sur la commande [COMMANDE]
  - `get-help [COMMANDE]`
  - `Get-Help [COMMANDE] -online`
  - `Get-Help [COMMANDE] -ShowWindow`
- `Get-Command` Rechercher une commande
  - `Get-Command *` Recherche toutes les commandes
  - `Get-Command -Name Get-Childitem -Args Cert: -Syntax`
  - `Get-Command -Verb New` Retrouver à partir du verbe
  - `Get-Command -Noun Service` Retrouver à partir du pronom
  - `Get-Command -Name *Service*` Retrouver les commandes contenant service
  - `Get-Command New-*`
  - `(Get-Command).count` Le nombre de commande
- `Get-Module` Liste les modules importés dans la version actuelle
### Commandes utiles PowerShell
- `$PSVersionTable` Version PowerShell
- `PowerShell` Passe en mode PowerShell
- `PWSH` Passe en mode PowerShell 7.x
### Historique des commandes
- `h` / `History` Affiche l'historique des commandes
- `clhy` / `Clear-History` Supprime l'historique des commandes
### Installation de module
- `Install-Module [NOM]`
  - `Install-Module [NOM] -MinimumVersion 2.2.5`
  - `Install-Module [NOM] -RequiredVersion 2.2.5`
  - `Install-Module [NOM] -Force`
### Fichiers
- `Test-Path [PATH]`
- `New-Item -Path [PATH] -Name [FileName] -ItemType file`
- `Add-Content -Path [PATH] -Value [TEXT]`
- `Get-Content [FILE_PATH]`
- `[COMMANDES] > [PATH]` Envoie le résultat de la commande dans un fichier
  - `Get-Service > test.txt` Envoie le résultat de la commande dans un fichier `.\test.txt`
### Processus et services
- `Get-Process | Measure-Object`
- `Get-Process | Measure-Object -Sum -Average`
- `(Get-Service Winrm).stop()` Stop Winrm
### Paramètres utiles
- `-WhatIf` Argument qui explique la commande
- `-Confirm:$true` Demande de confirmer la commande
- `$pass=Read-Host -AsSecureString` Permet la saisie de mot de passe

## Formattage
- `[COMMANDE] | Get-Member` Liste les propriétés d'un objet
  - `Get-ADUser -filter * | Get-Member` Liste les propriétés de tout les utilisateurs du domaine
  - `Get-ADUSer -properties * | Get-Member` Liste les propriétés de toutes les propriétés d'un utilisateur
- `[COMMANDE] | FORMAT-[LIST|TABLE|Wide]` Type de format en sortie
  - `Get-Service | Format-Table` Liste des services au format table
  - `Get-Service | Format-Table name` Liste des services au format table (Uniquement le nom)
  - `Get-Service | Sort-Object -Property Name` Liste les services en filtrant par nom
  - `Get-Service | Sort-Object -Property Name -Descending` Liste les services en filtran par nom descendant
- `Get-Service | Out-GridView` Format externe sous forme de tableau