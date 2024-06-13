# Tâches
## Tâche globale
Réseau à créer (Avec Active directory redondant)

![Exemple de réseau complet](https://github.com/Altherneum/.github/blob/main/note/assets/fil-Rouge.png?raw=true)

## Tâche réseau 1
Réseau d'apprentissage (Création d'un domaine, DNS, DHCP, ...)

![Exemple de réseau à créer](https://github.com/Altherneum/.github/blob/main/note/assets/MicrosoftTeams-image.png?raw=true)

## Outils
- [Cours / Hyperviseur](https://doc.altherneum.fr/cours/hyper-v.html)
- [Cours / Windows](https://doc.altherneum.fr/cours/windows.html)
- [Cours / DNS](https://doc.altherneum.fr/cours/dns.html)
- [Cours / Active Directory](https://doc.altherneum.fr/cours/active-directory)
- ...

# Adressage
## Commutateur / Switch
### NAT
- `Interne`
- `NAT`
#### Liste des périphériques sur le switch NAT
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)

### Serveurs
- `Privé`
- `Serveurs`
#### Liste des périphériques sur le switch Serveurs
- [WIN22-SRV-1](#win22-srv-1)
- [WIN22-SRV-2](#win22-srv-2)
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)

### Clients
- `Privé`
- `Clients`
#### Liste des périphériques sur le switch Clients
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)

## Serveurs Windows
### Win22-SRV-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

- Gère le [DNS](#DNS)
- Gère l'[Active Directory](#Active-Directory)

- IP : `192.168.10.10`
- Masque : `255.255.255.0`
- Gateway : `192.168.10.254`

- Nom de l'ordinateur : `WIN22-SRV-1`
- Suffixe DNS : `FORMATION.LAN`

- Server DNS préféré : `127.0.0.1`

### Win22-SRV-2
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

- Gère le [DNS auxiliaire](#DNS-auxiliaire)

- IP : `192.168.10.11`
- Masque : `255.255.255.0`
- Gateway : `192.168.10.254`

- Nom de l'ordinateur : `WIN22-SRV-2`
- Suffixe DNS : `FORMATION.LAN`

- Server DNS préféré : `127.0.0.1`
- Serveur DNS auxiliaire : `192.168.10.10`

### Win22-SRV-RTR-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`, `Clients`, et `NAT`

## DNS
### DNS principal
- Contrôlé par [Win22-SRV-1](#Win22-SRV-1)
- Nom de l'alias `www`
- Nom de domaine pleinement qualifié (FQDN) : `www.FORMATION.LAN.`
#### Zones de recherche directes
- `win22-srv-1.formation.lan`
- `FORMATION.LAN`
#### Zones de recherche inversée
Domaine : `10.168.192.in-addr.arpa`

### DNS auxiliaire
- Contrôlé par [Win22-SRV-2](#Win22-SRV-2)
#### Zones de recherche directes secondaire
- Connecté sur : `FORMATION.LAN`
- Connecté sur : `192.168.10.10`
- Nom de domaine complet du serveur : `WIN22-SRV-1.FORMATION.LAN` 
#### Zones de recherche inversée secondaire
- Connecté sur l'ID réseau : `192.168.10`
- Connecté sur l'adresse IP : `192.168.10.10`
- Connecté sur le nom de domaine complet du serveur : `WIN22-SRV-1.FORMATION.LAN`
- Connecté sur le domaine : `10.168.192.in-addr.arpa`

## Active Directory
### Structure d'UO
- `@_FORMATION`
- - `Utilisateurs`
- - - `IT`
- - - `RH`
- - `Ordinateurs`
- - - `IT`
- - - `RH` (N'est pas encore crée)
- - `Groupes`
- - - `IT`
- - - `RH`
- - `Partages`

### Groupes
- `G_RH_RW`
- - `D_RH_RW`
- `G_IT_RW`
- - `D_IT_RW`

### Utilisateurs
#### IT
- `Nordine HATEUR`
- `Sarah CROCHE`
#### RH
- `Paul EMPLOI`
- `France TRAVAIL`

## DHCP
- Dynamic Host Configuration Protocol
- N'est pas encore crée

## Clients
- PC classique
- N'est pas encore crée