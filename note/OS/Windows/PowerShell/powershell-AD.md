# PowerShell et Active directory
## Configurer le serveur
### Commandes Active Directory
- `Rename-Computer -NewName "NAME" -Restart`
- `Get-WindowsFeature` Liste des features Windows

### Configuration de l'IP
- `Get-NetIPInterface` Liste des configurations IP
- `Get-NetAdapter` Propriétés basiques des adaptateurs réseau
- `Get-netadapter -Name Wi-Fi` Propriété de l'adaptateur Wi-Fi 
- `New-NetIPAddress –InterfaceIndex <ID> –IPAddress <IP> –PrefixLength <CIDR> –DefaultGateway <IP>`
- `Set-NetIPInterface -InterfaceIndex 12 -Dhcp {Enabled/Disabled}`

#### Scripts de configuration de l'IP
```
Set-NetIPAddress –InterfaceIndex 4 –IPAddress 192.169.10.14 –PrefixLength 24 –DefaultGateway 192.169.10.254
Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses 192.168.10.10
Get-NetAdapter | Restart-NetAdapter

### Enable Ping
NetSH advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
NetSH advfirewall firewall add rule name="ICMP Allow outgoing V4 echo request" protocol="icmpv4:8,any" dir=out action=allow
```

### Configuration VM-Switch
- `Get-VMSwitch` Commande qui liste les switchs
- `New-VMSwitch -Name <switch-name> -NetAdapterName <netadapter-name>`

## Créer le domaine
### Installer ADDS
```
Install-WindowsFeature AD-Domain-Services  `
-IncludeAllSubFeature  `
-IncludeManagementTools
```

### Créer la fôret
```
Write-Host "Entrez le SafeModeAdministratorPassword" ; $pass=Read-Host -AsSecureString
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DomainName "PowerShell.LAN" `
-DomainMode Default `
-ForestMode Default `
-DomainNetbiosName "PowerShell" `
-InstallDns:$true `
-NoRebootOnCompletion:$false `
-SafeModeAdministratorPassword $pass `
-Force:$true
shutdown -r -t 0
```

### Organizational Unit
Créer une unitée organisation : 
- `New-ADOrganizationalUnit -DisplayName "SuperOUName" -Name "SuperOUName" -Path "DC=PowerShell,DC=LAN"`

## Accounts
### New AD User
Créer un utilisateur :
```
New-ADUser -DisplayName "Sylvie" -Name "Sylvie" -Surname "DESILVA" -SamAccountName "sylvie" -UserPrincipalName "sylvie@form.loc" -Path "OU=Utilisateurs,DC=PowerShell,DC=LAN" -PasswordNeverExpires $true -AccountPassword (Write-Host "Tappez le mot de passe du compte à créer : ");(Read-Host -AsSecureString) -Enabled $true
```
- SamAccountName
  - Identifiant de connexion
  - Il doit être unique au niveau du domaine
  - La variable d'environnement %USERNAME% s'appuie sur le samAccountName

#### LogonWorkstations
`-LogonWorkstations` Permet de spécifier les ordinateurs auxquels l'utilisateur peut accéder
- Pour spécifier plusieurs ordinateurs, créez une seule liste séparée par des virgules
- Vous pouvez identifier un ordinateur à l'aide du nom du compte Security Account Manager (SAM) (SamAccountName) ou du nom d'hôte DNS de l'ordinateur
  - Le nom du compte SAM est identique au nom NetBIOS de l'ordinateur

### Set AD Account Password
Modifier le mot de passe d'un compte :
```
Set-ADAccountPassword -Identity "Sylvie" -NewPassword (ConvertTo-SecureString -AsPlainTex "ABC123@!123" -Force)`
- `Set-ADAccountPassword -Identity sylvie -NewPassword (Write-Host "Tappez le nouveau mot de passe du compte : ");(Read-Host -AsSecureString)
```

### Enable AD Account
Activer un compte :
- `Enable-ADAccount -Identity "sylvie"`

### Unlock AD Account
Débloquer un compte :
- `Unlock-ADAccount -Identity "sylvie"`
  - Distinguished Name : `-Identity "CN=Patti Fuller,OU=Finance,OU=Users,DC=FABRIKAM,DC=COM"`

### Disable AD Account
Désactiver un compte :
- `Disable-ADAccount -Identity "sylvie"`
  - Distinguished Name : `-Identity "CN=Patti Fuller,OU=Finance,OU=Users,DC=FABRIKAM,DC=COM"`
- `Get-ADUser -Filter 'Name -like "*"' -SearchBase "OU=Finance,OU=Users,DC=FABRIKAM,DC=COM" | Disable-ADAccount`

## Ajouter des ordinateurs
`Add-Computer -DomainName form.loc -DomainCredential administrateur@form.loc -Restart` [Doc MS PwS](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/add-computer?view=powershell-5.1)
- `Add-Computer -ComputerName "Win10-PC-1" -DomainCredential Administrateur@PowerShell.lan -DomainName PowerShell -Restart -Force`
- `Add-Computer -ComputerName "192.168.10.100" -DomainCredential Administrateur@PowerShell.lan -DomainName PowerShell -Restart -Force` (WMI doit être autorisé sur le pare-feu de l'ordinateur)
  - `Pare-Feu`, `Infrastructure de gestion Windows (WMI)`