# Tâches
## Tâche globale
Réseau à créer (Avec Active directory redondant)

![Exemple de réseau complet](/note/assets/images/fil-Rouge.png)

## Tâche réseau 1
Réseau d'apprentissage (Création d'un domaine, DNS, DHCP, ...)

![Exemple de réseau à créer](/note/assets/images/MicrosoftTeams-image.png)

## Outils
- [Cours / Hyperviseur](https://doc.altherneum.fr/cours/hyper-v.html)
- [Cours / Windows](https://doc.altherneum.fr/cours/windows.html)
- [Cours / DNS](https://doc.altherneum.fr/cours/dns.html)
- [Cours / Active Directory](https://doc.altherneum.fr/cours/active-directory)
- ...

# Adressage
## Commutateur / Switch
### N/A
- [WIN22-SRV-3](#win22-srv-3)
- [WIN22-SRV-VPN-2](#win22-srv-vpn-2)
- [WIN22-SRV-RTR-2](#win22-srv-rtr-2)

### NAT
- `Externe`

- En `DHCP`

#### Liste des périphériques sur le switch NAT
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)

### Serveurs
- `Privé`

- `192.168.10.254`
- `255.255.255.0`

#### Liste des périphériques sur le switch Serveurs
- [WIN22-SRV-1](#win22-srv-1)
- [WIN22-SRV-2](#win22-srv-2)
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)
- [WIN22-SRV-VPN-1](#win22-srv-vpn-1)

### Clients
- `Privé`

- `192.168.20.254`
- `255.255.255.0`

#### Liste des périphériques sur le switch Clients
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)
- [WIN10-PC-1](#Win10-PC-1)

### NAT-2
- `Externe`
#### Liste des périphériques sur le switch NAT-2

### Serveurs-2
- `Privé`
#### Liste des périphériques sur le switch Serveurs-2
- [Win22-SRV-3](#win22-srv-3)
- [Win22-RTR-2](#win22-srv-rtr-2)

### Clients-2
- `Privé`
#### Liste des périphériques sur le switch Clients-2
- [Win22-RTR-2](#win22-srv-rtr-2)

## Serveurs Windows
- ISO : `Windows Server 2022 build 20348.169.210806-2348`
### Win22-SRV-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

- Gère le [DNS](#DNS)
- Gère l'[Active Directory](#Active-Directory)
- `Mot de passe de restauration des services d'annuaire (DSRM)` : `Respons11`

- IP : `192.168.10.10`
- Masque : `255.255.255.0`
- Gateway : `192.168.10.254`

- Server DNS préféré : `127.0.0.1`

- Nom de l'ordinateur : `WIN22-SRV-1`
- Suffixe DNS : `FORMATION.LAN`
- Domaine : `FORMATION.LAN`


### Win22-SRV-2
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

- Gère le [DNS auxiliaire](#DNS-auxiliaire)
- Gère l'[Active Directory](#Active-Directory) secondaire (Clone)
- `Mot de passe de restauration des services d'annuaire (DSRM)` : `Respons11`
- Réplication depuis : `Win22-SRV-1.FORMATION.LAN`

- IP : `192.168.10.11`
- Masque : `255.255.255.0`
- Gateway : `192.168.10.254`

- Server DNS préféré : `127.0.0.1`
- Serveur DNS auxiliaire : `192.168.10.10`

- Nom de l'ordinateur : `WIN22-SRV-2`
- Domaine : `FORMATION.LAN`
- Suffixe DNS : `FORMATION.LAN`

### WIN22-SRV-3
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveurs-2`
- Va être AD RODC sur un autre réseau

- IP : `192.169.10.10`
- Masque : `255.255.255.0`
- Gateway : `192.169.10.254`

- Server DNS préféré : `127.0.0.1`

### WIN22-SRV-4
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveurs`

- Gère le domaine enfant : `M2I.FORMATION.LAN`

- IP : `192.169.10.12`
- Masque : `255.255.255.0`
- Gateway : `192.169.10.254`

- Server DNS préféré : `127.0.0.1`
- Server DNS auxiliaire : `192.168.10.10`

### WIN22-SRV-5
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveurs`

- Gère l'[Active Directory](#Active-Directory)
  - Domaine enfant bis : `ETUDE.LOCAL`
- Approbation du domaine `FORMATION.LAN`

- IP : `192.169.10.13`
- Masque : `255.255.255.0`
- Gateway : `192.169.10.254`

- Server DNS préféré : `127.0.0.1`

### PS-VM-Test
- Admin password : `SuperUser11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveurs`

- IP : `192.169.10.14`
- Masque : `255.255.255.0`
- Gateway : `192.169.10.254`

- Server DNS préféré : `192.168.10.10`

### PS-VM-Test-NoGUI
- Admin password : `SuperUser11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveurs`

- IP : `192.169.10.15`
- Masque : `255.255.255.0`
- Gateway : `192.169.10.254`

- Server DNS préféré : `192.168.10.10`

### Win22-SRV-RTR-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`, `Clients`, et `NAT`
Carte Serveurs
  - IP : `192.168.10.254`
  - Masque : `255.255.255.0`
- Carte Clients
  - IP : `192.168.20.254`
  - Masque : `255.255.255.0`

- Nom de l'ordinateur : `WIN22-SRV-RTR-1`
- Suffixe DNS : `FORMATION.LAN`
- Domaine : `FORMATION.LAN`

### Win22-SRV-RTR-2
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur-2`, `Clients-2`, et `NAT`
Carte Serveurs
  - IP : `192.169.10.254`
  - Masque : `255.255.255.0`
- Carte Clients
  - IP : `192.169.20.254`
  - Masque : `255.255.255.0`

### Win22-SRV-VPN-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

- Carte : `Serveur`
  - IP : `192.168.10.253`
  - Masque : `255.255.255.0`
  - Passerelle par défaut : `192.168.10.254`
- Carte : `NAT`
  - `10.0.0.1`
  - `255.255.255.0`

- Serveur DNS préféré : `192.168.10.10`
- Serveur DNS auxiliaire : `192.168.10.11`

- Domaine : `WORKGROUP`
- Nom du poste : `Win22-SRV-VPN-1`

- VPN-1
- Respons11
- Se connecte à : 192.169.10.253
- Se connecte à : VPN-2 avec Respons11

### WIN22-SRV-VPN-2
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveurs-2`

- Carte : `Serveurs-2`
  - IP : `192.169.10.253`
  - Masque : `255.255.255.0`
  - Passerelle par défaut : `192.169.10.254`
- Carte : `NAT`
  - `10.0.0.2`
  - `255.255.255.0`

- Serveur DNS préféré : `192.169.10.10`

- Domaine : `WORKGROUP`
- Nom du poste : `Win22-SRV-VPN-2` (N'a pas été fait ⚠)

- VPN-2
- Respons11
- Se connecte à : 192.168.10.253
- Se connecte à : VPN-1 avec Respons11

## Clients
- ISO : `Windows 10 21h2`
### Win10-PC-1
- Login : `PC-1` 
- Password : `Respons11`, 
- Question de sécurité : `Respons11` x 3
- Carte réseau sur `Clients`

- Adresse IP `192.168.20.15`
- Masque de sous-réseau : `255.255.255.0`
- Passerelle par défaut : `192.168.20.254`

- ~~Serveur DNS préféré : `192.168.10.10`~~
- ~~Serveur DNS auxiliaire : `192.168.10.11`~~
  - Déplacé dans `192.168.10.14` pour des tests PowerShell

- Domaine : `FORMATION.LAN`
- Nom du poste : `Win10-PC-1`

### Debian
- Login : `root`
  - Password : `SuperUser11`
- Login : `jeb`
  - Password : `User11`

- Carte réseau sur `NAT`
- Nom du poste : `Debian`

### AlmaLinux
- Login : `root` / `jeb`
- Password : `SuperUser11`
- Carte réseau sur `NAT`


## DNS
### DNS principal
- Contrôlé par [Win22-SRV-1](#Win22-SRV-1)
- Nom de l'alias `www`
- Nom de domaine pleinement qualifié (FQDN) : `www.FORMATION.LAN.`
#### Zones de recherche directes
- `SOA` : `win22-srv-1.formation.lan`
- `FORMATION.LAN`, `Mises à jour dynamique` : `Sécurisé uniquement`, `Enregistrer la zone dans Active Directory`, `Zone principale`

#### Zones de recherche inversée
- `10.168.192.in-addr.arpa`, `Mises à jour dynamique` : `Sécurisé uniquement`, `Enregistrer la zone dans Active Directory`, `Zone principale`
- `20.168.192.in-addr.arpa`, `Mises à jour dynamique` : `Sécurisé uniquement`, `Enregistrer la zone dans Active Directory`, `Zone principale`

### DNS auxiliaire
- Contrôlé par [Win22-SRV-2](#Win22-SRV-2)
#### Zones de recherche directes secondaire
- Connecté sur : `FORMATION.LAN`
- Connecté sur : `192.168.10.10`
- Connecté sur le nom de domaine complet du serveur : `WIN22-SRV-1.FORMATION.LAN` 
#### Zones de recherche inversée secondaire
- Connecté sur l'ID réseau : `192.168.10`
- Connecté sur l'adresse IP : `192.168.10.10`
- Connecté sur le nom de domaine complet du serveur : `WIN22-SRV-1.FORMATION.LAN`
- Connecté sur le domaine : `10.168.192.in-addr.arpa`

## Active Directory
### Structure d'unité d'organisation
#### FORMATION.LAN
- `@_FORMATION`
-  - `Utilisateurs`
-  -  - `IT`
-  -  - `RH`
-  - `Ordinateurs`
-  -  - `IT`
-  -  - `RH`
-  - `Groupes`
-  -  - `IT`
-  -  - `RH`
-  - `Partages`
-  -  - `IT`
-  -  - `RH`
-  - `Imprimantes` (N'existe pas encore)
##### Groupes
- `G_RH_RW`
-  - `D_RH_RW`
- `G_IT_RW`
-  - `D_IT_RW`
-  -  - `U_IT_RW`
##### Utilisateurs
###### IT
- `Nordine HATEUR`, `N123456789`, `SuperUser11`
- `Sarah CROCHE`, `S123456789`, `Azerty11` (Mot de passe non changé)
###### RH
- `Paul EMPLOI`, `P123456789`, `Azerty11` (Mot de passe non changé)
- `France TRAVAIL`, `F123456789`, `Azerty11` (Mot de passe non changé)
##### Partage
- `C:/`
-  - `@_Ressources/`
-  -  - `Services/`
-  -  -  - `RH`, (`\\Win22-srv-1\rh`)
-  -  -  - `IT`, (`\\Win22-srv-1\it`)
-  -  - `GPL/` (`\\Win22-srv-1\gpl`) (Chrome, Firefox, Putty, VLC, ...)
-  -  - `FDE/` (`\\Win22-srv-1\fde`) (Logo M2I)

#### ETUDE.LOCAL
- `@_ETUDE`
-  - `Utilisateurs`
-  - `Ordinateurs`
-  - `Groupes`
-  -  - `IT`
-  - `Partages`

##### Groupes
- `G_IT_RW`
-  - `D_IT_RW`
-  -  - `U_IT_RW @FORMATION.LAN` (à tester car NOK)
## DHCP
- Dynamic Host Configuration Protocol
- N'est pas encore crée