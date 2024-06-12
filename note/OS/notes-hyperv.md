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

# Tâches
![Exemple de réseau à créer](https://github.com/Altherneum/.github/blob/main/note/assets/MicrosoftTeams-image.png?raw=true)

# Adressage
## Win22-SRV-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

## Win22-SRV-2
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`

## Win22-SRV-RTR-1
- Admin password : `Respons11`
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Serveur`, `Clients`, et `NAT`

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
- Doit avoir IP statique
- Nom commun
- Suffix DNS

## DHCP

## Clients
- PC classique

## AD
- Active directory

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
- [DNS](#DNS)
- DHCP
- AD
- Poste client