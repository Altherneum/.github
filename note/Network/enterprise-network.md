# Tâche
![Exemple de réseau à créer](https://github.com/Altherneum/.github/blob/main/note/assets/MicrosoftTeams-image.png?raw=true)

## Outils
- [Cours / Hyperviseur](https://doc.altherneum.fr/cours/hyper-v.html)
- [Cours / Windows](https://doc.altherneum.fr/cours/windows.html)
- [Cours / DNS](https://doc.altherneum.fr/cours/dns.html)
- ...

# Adressage
## Commutateur / Switch
### NAT
- Interne
- `NAT`

### Serveurs
- Privé
- `Serveurs`

### Clients
- Privé
- `Clients`

## Serveurs Windows
### Win22-SRV-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

- Gère le [DNS](#DNS)

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
### Comment ajouter un DNS
- [/cours / dns # Ajouter-le-rôle-DNS](https://doc.altherneum.fr/cours/dns#Ajouter-le-rôle-DNS)

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

## AD
- Active directory
- [TDL](#to-do)

### Installer le rôle AD DS
- `Gérer`, `Ajouter des rôle et fonctionnalité`
- Fonctionnalité `AD DS`
![Promotion en contrôleur de domaine](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_saelIxaPD4.png?raw=true)

- `Promouvoire en contrôleur de domaine`

### Ajouter une fôret
- Nom de domaine racine : `FORMATION.LAN`
- Version : `Windows Server 2016`
- Mot de passe : `Respons11`
- Ne pas `Créer de délégation DNS` ❌
- Nom de domaine NetBIOS : `FORMATION`  
[Voire fichier ad.txt](ad.txt)

### Supprimer AD
- `Gérer role et fonc`
- Décocher `DNS` / `AD DS`
- Bouton : `Supprimer`
- `Rétrograder le contrôleur de domaine`
- Cocher dernier contrôleur de doamine
- Cocher supprimer

# To do list
## DHCP
- Dynamic Host Configuration Protocol
- [TDL](#to-do)

## Clients
- PC classique
- [TDL](#to-do)
