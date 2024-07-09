# PowerShell et Active directory
## Commandes
### Commandes Active Directory
- `Rename-Computer -NewName "NAME" -Restart`
- `Get-WindowsFeature` Liste des features Windows
## Configuration de l'IP
- `Get-NetIPInterface` Liste des configurations IP
- `Get-NetAdapter` Propriétés basiques des adaptateurs réseau
- `Get-netadapter -Name Wi-Fi` Propriété de l'adaptateur Wi-Fi 
- `New-NetIPAddress –InterfaceIndex <ID> –IPAddress <IP> –PrefixLength <CIDR> –DefaultGateway <IP>`
- `Set-NetIPInterface -InterfaceIndex 12 -Dhcp {Enabled/Disabled}`

## Script
## Installer ADDS
```
Install-WindowsFeature AD-Domain-Services  `
-IncludeAllSubFeature  `
-IncludeManagementTools
```

### Configuration de l'IP
```
# Get-NetAdapter # Liste des cartes réseaux et leurs indexes
Set-NetIPAddress –InterfaceIndex 4 –IPAddress 192.169.10.14 –PrefixLength 24 –DefaultGateway 192.169.10.254
Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses 192.168.10.10
Get-NetAdapter | Restart-NetAdapter

# Enable Ping
NetSH advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow
NetSH advfirewall firewall add rule name="ICMP Allow outgoing V4 echo request" protocol="icmpv4:8,any" dir=out action=allow
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