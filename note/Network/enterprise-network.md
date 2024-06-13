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
#### Liste des périphériques sur le switch NAT
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)

### Serveurs
- Privé
- `Serveurs`
#### Liste des périphériques sur le switch Serveurs
- [WIN22-SRV-1](#win22-srv-1)
- [WIN22-SRV-2](#win22-srv-2)
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)

### Clients
- Privé
- `Clients`
#### Liste des périphériques sur le switch Clients
- [WIN22-SRV-RTR-1](#win22-srv-rtr-1)

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
- `Gérer`, `Ajouter des rôles et fonctionnalités`
- Fonctionnalité `AD DS`

![Promotion en contrôleur de domaine](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_saelIxaPD4.png?raw=true)
- `Promouvoir ce serveur en contrôleur de domaine`

### Ajouter une fôret
- Nom de domaine racine : `FORMATION.LAN`
- Version : `Windows Server 2016`
- Mot de passe : `Respons11`
- Ne pas `Créer de délégation DNS` ❌
- Nom de domaine NetBIOS : `FORMATION`  
[Voire fichier ad.txt](ad.txt)

# To do list
## DHCP
- Dynamic Host Configuration Protocol
- [TDL](#to-do)

## Clients
- PC classique
- [TDL](#to-do)

# Supprimer AD
❌ **__à vérifier avant__**
- `Gérer`, `Supprimer des rôles et fonctionnalités`
- Décocher `DNS` / `AD DS`
- Bouton : `Supprimer`
- `Rétrograder le contrôleur de domaine`
- Cocher `dernier contrôleur de doamine`
- Cocher `supprimer` les valeurs

# Centre d'administration active directory
## Corbeille
- `Vue d'ensemble`
- `Activer la corbeille`
- Action irreversible  
Permet de récupérer des User / UO / objets supprimés
- Sera dans `CN=Deleted Objects,DC=FORMATION,DC=LAN`  
ou `Centre d'administration Active Directory` > `FORMATION (Local)` > `Deleted objects`

## Utilisateurs et ordinateurs Active Directory
- Liste des Ordinateurs, utilisateurs, domaines, groupes
## Unité d'organisation
- `UO` : `Unité d'organisation`
- Permet de trier / filtrer des groupes d'objets
- `Clique droit`, `Nouveau`, `Unité d'organisation`
- `Nom` : `@_FORMATION`  
(Permet d'être la première unité visible dans la liste)
- Dans `@_FORMATION`, créer l'UO `Utilisateurs`, `Ordinateurs`, `Groupes`, `Partages`
- Dans `Ordinateurs` `Utilisateurs` et `Groupes` créer l'UO `IT`
- Dans `Utilisateurs` créer l'UO `RH`

## Créer un utilisateur
- Créer un utilisateurs dans `Utilisateurs/IT`  
`Nordine` `HATEUR`, Login : `N123456789`, Password : `Azerty11` (Avec l'option : `L'utilisateur doit changer le mot de passe à la prochaine ouverture de session`), dans l'UO `Utilisateurs/IT`
- Second utilisateur  
`Sarah` `CROCHE` `S123456789` `Azerty11`, dans l'UO `Utilisateurs/IT`
- 3ème utilisateur  
`Paul` `EMPLOI` `P123456789` `Azerty11` dans l'UO `RH`
- 4ème utilisateur  
`France` `TRAVAIL` `F123456789` `Azerty11` dans l'UO `RH` ⚠ N'a pas été crée

### Horaire d'accès

### Désactiver un compte

#### Par date
Option `Compte` des `Propriétés` de l'utilisateur

#### Manuellement
`Clique droit` sur l'utilisateur, `Toutes les tâches`, `Désactiver le compte`

### Se connecter à
- Bouton : `Se connecter à`  
Limite les ordinateurs sur le quel l'utilisateur peut se connecter

### Profil
- `Scripts de démarrage` (Pour scripter au lancement de la session)
- `Chemin de profil` Stock sur le réseau son environnement en cas de changement de poste

### Modifier ou supprimer
- `Affichage`, `Fonctionnalité avancé`, `Clique droit` sur l'objet à modifier / supprimer et `Propriétés`, catégorie `Objets`, décocher `Protéger l'objet des suppressions accidentelles`

### Groupe
#### Sécurité 
Accès au ressource partagés

#### Distribution
Recevoir des messages

#### Porté
![Portée des groupes](https://github.com/Altherneum/.github/blob/main/AD-Group-Range.png.raw=true)
##### Domaine local
Accès que au ressources locale de son propre groupe
##### Globale
Accès à toute la fôret de l'Active Directory
##### Universelle
Accès à toutes les ressources partagés aux groupes universelle
