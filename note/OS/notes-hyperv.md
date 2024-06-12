# Hyperviseur
Un hyperviseur est une plate-forme de virtualisation qui permet à plusieurs systèmes d’exploitation de fonctionner en parallèle dans une seule machine physique.
![hyperviseur](https://github.com/Altherneum/.github/blob/main/note/assets/hyperviseur-type-1-et-2.png?raw=true)

## Niveau 1
- Se suffit à lui même (N'a pas besoin d'un OS)
- Ils sont généralement plus performants et plus sécurisés 
- Sont aussi appelés hyperviseurs natifs ou bare-metal, car ils s'exécutent directement sur le matériel physique
- Ex : ESXI, Vsphere

## Niveau 2
- Requiert un OS (Windows / Linux) compatible avec l'hyperviseur
- S'exécutent sur un système d'exploitation hôte
- Ex : VirtualBox, HyperV, VMWare Workstation, 

## Créer un PC virtuel
- Nouveau ▶ Ordinateur virtuel

- `C:\Users\Administrateur\Desktop\Hyper-V`
- 📜 [**OS**][**Date**]-[**SRV/PC**]-[**ID**]
  - Exemple : `Win22-SRV-1`
- 👴 Génération 2
- 🧠 Mémoire dynamique ▶ 2048Mo
- 💻 2 V-CPU
- 📂 50Go storage
- 💾 Service d'intégration ▶ Service d'invité
- 💽 Installer l'ISO (Windows Server Datacenter user experience (GUI))

### ISO
![Lecteur DVD et ISO](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_TWnWBAwE7M.png?raw=true)
- Paramètres [Win22-SRV-0](#Win22-SRV-0) ▶ Lecteur DvD ▶ Ajouter ▶ Lier l'ISO
  - sources_iso (srvapp.m2iformation.local) (Y:\)
    - /Microsoft/Windows Server 2022 Evaluation
    - /Microsoft/Windows 10 Evaluation
- Penser à retirer l'ISO (Pour pouvoir le déplacer / supprimer)

## Créer un commutateur virtuel
- Gestionnaire de commutateur virtuel
- Privé ou interne

![Configuration](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_ViSv9fGoJe.png?raw=true)

# Tâche
![Exemple de réseau à créer](https://github.com/Altherneum/.github/blob/main/note/assets/MicrosoftTeams-image.png?raw=true)

# Adressage
## Win22-SRV-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`
- Gère le [DNS](#DNS)

## Win22-SRV-2
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

## Win22-SRV-RTR-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`, `Clients`, et `NAT`

### Connecter les cartes réseaux
![ajouter des cartes réseau](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_QRr4HxxUCH.png?raw=true)

![cartes réseau](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_6iWU7wUKqo.png?raw=true)

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

## DNS
- Contrôlé par [SRV 1](#win22-srv-1)

- IP : `192.168.10.10`
- Masque : `255.255.255.0`
- Gateway : `192.168.10.254`
- Server DNS préféré : `127.0.0.1`

- Nom de l'ordinateur : `WIN22-SRV-1`
- Suffixe DNS : `FORMATION.LAN`

### Passer le DNS en statique
- Explorateur de fichiers
- Paramètres carte réseau
- Ethernet
- Propriétés
- IPv4
- IP statique en suivant [# DNS](#DNS)

![DNS IP settings](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_ChaWlB2FCn.png?raw=true)

- Puis faire un [flushDNS](#flushdns)

### flushdns
- Une fois l'adresse IP modifiée
- Vérifier la configuration  
`ipconfig /all`
- Penser à flush le DNS  
`ipconfig /flushdns` Vide le cache DNS
- Penser à ping pour vérifier  
`ping 192.168.10.10`

### Renommer l'ordinateur et changer le suffixe DNS
- Ce PC
- Propriétés
- Paramètres avancés du système 
- Nom de l'ordinateur
- Modifier
- Changer le nom du serveur `WIN22-SRV-1`
- Aller sur "Autre"
- Passer le suffix DNS vers `FORMATION.LAN`
- Redémarrer et vérifier via
`ipconfig /all`

## DHCP
- Dynamic Host Configuration Protocol
- [TDL](#to-do)

## Clients
- PC classique
- [TDL](#to-do)

## AD
- Active directory
- [TDL](#to-do)

---

# Autres notes
## CTRL ALT SUPPR
![touche](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_9hxQEdb0vA.png?raw=true)

## Session étendu
Permet :
- copier / coller
- partager des fichiers depuis le PC physique
- ...

![paramètre](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_WhqhXRQbdJ.png?raw=true)

# To Do
## Post install
- ~~[DNS](#DNS)~~
- Passer [SRV 1](#win22-srv-1) dans l'AD au lieu du workgroup
- [DHCP](#DHCP)
- [AD](#AD)
- [Poste client](#Clients)

## Notes
### Workgroup
- Libre d'entrée
- Plusieurs PC connectés ensemble
- Partage les ressources que de la "cible" que vous demandez (Avec authentification)
- Tout est décentralisé sur chaque poste (Authentification) ce qui surcharge (Comme à partir de > 10 postes)

### Active directory
- Serveur gère le domaine de PC
- Centralise (Authentification comme fichiers ou règles de domaine)
- Partage l'ensemble des ressources à tout le monde (Une seul authentification pour tout le réseau)