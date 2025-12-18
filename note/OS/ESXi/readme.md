# ESXi
- ESXi9A
- ESXi9B (pour de la haute disponibilité)

- Windows AD

- VCenter

- VMs

## Configurer VMWare Workstation
- `Edit` > `Preferences` > `Workspace`
  - `Default VM location` : `C:\VM`
  - `Default hardware compatibility` : `ESXi 7.0`

- `Edit` > `Preferences` > `Memory`
  - `Allow most virtual machine memory to be swapped`

- `Edit` > `Preferences` > `Hot Keys`
  - `CTRL` + `ALT` Pour sortir le curseur de la VM

- `Edit` > `Virtual Network Editor`
  - `Change settings` pour passer en administrateur
  - Supprimer toutes les cartes réseau par défaut : `Remove Network`
  - Ajouter de nouvelles cartes réseau : `Add Network...`
    - `VMnet5`, `Rename Network...` : `LAN1`, `Bridged`
    - `VMnet6`, `Rename Network...` : `LAN2`, Décocher `Use local DHCP service to distribute IP address to VMs`, renommer la carte dans les `connexions réseau` Windows
    - `VMnet7` , `Rename Network...` : `LAN3`, Décocher `Use local DHCP service to distribute IP address to VMs`, renommer la carte dans les `connexions réseau` Windows
    - `VMnet9`, `Rename Network...` : `LAN4`, Décocher `Use local DHCP service to distribute IP address to VMs`, Décocher `Connect a host virtual adapter to this network`

## Créer une VM
- Custom
- ESXi 7.0
- VMWare-VMVisor-Installer-7.0 [...] .iso
- `Virtual machine name` : ESXi9A
- 4 CPU
- 1 Coeur
- 16G RAM
- Bridge
- Paravirtualized SCSI
- SCSI

- Next ...

## Configurer la VM
### Carte réseau
- Placer sur la carte résau LAN1
  - `Virtual Machine Settings` > `Network Adapter` > `Custom: Specific virtual network` > `LAN1`
### Carte réseau bis
- Bouton `Add...` > `Network Adapter`
  - Le configurer sur `LAN2`
  - Faire de même pour `LAN3`, `LAN4`
### Disque dur
- `Add...`
- `Hard Disk`
- `SCSI`
- `Create a new virtual disk`
- Appliquer la taille du disque, `Store virtual disk as a single file`
### Lancer la VM
- `Entrer` pour valider
- `F11` pour accepter l'EULA
- `Entrer` pour sélectionner un disque
- `French`
- Root password : `SuperUser11` / `VMware1!`
  - `Entrer` pour valider le mot de passe
- `F11` pour lancer l'installation et écrire sur le disque
- `Entrer` pour finaliser l'installation
### Configurer la carte réseau
- `F2`
- `Configure Management Network`
- `IPv4 Configuration`
- `Set static IPv4 address and network configuration:`
- Touche `Espace`
- `IPv4 address` : `10.210.17.151` (ESXi9A)
- `IPv4 address` : `10.210.17.152` (ESXi9B)

Plage d'adresses IPv4
```
10.210.17.151
10.210.17.160
```

- `Disable IPv6 (Restart required)`
- `DNS Configuration`
- `Use the following DNS server address and hostname` : `10.210.17.153`
- `Hostname` : `ESXi9a`

- `Custom DNS Suffixes` : `form9.loc`

- `Troubleshouting`
  - Sur `Enable ESXi Shell` Faire `Entrer` pour activer l'ESXi Shell
  - Sur `Enable SSH` Faire `Entrer` pour activer SSH
  - Sur `Modify DCUI idle timeout` Faire `Entrer` et mettre `0` afin d'arrêter la mise en veille automatique, `Entrer` pour valider

## Utilisation du shell ESXi
- `ALT` + `F1` : Pour aller dans le shell

- `esxcli network ip dns search list` Pour lister les domaines DNS
- `esxcli network ip dns search remove -d altherneumformation.local` Afin de retirer le domaine DNS par défaut
- `esxcli system hostname set --host=ESXi9A`
- `esxcli system hostname set --fqdn=ESXi9A.form9.loc`

- `esxcli network ip connection list`
- `esxcli network ip interface list`
- `esxcli network ip interface ipv4 address list`
- `esxcli network nic list`

- `ALT` + `F2` : Pour quitter le shell

## Interface Web
- Sur un navigateur : `10.210.17.151`
  - `IPv4 address` : `10.210.17.151` (ESXi9A)
  - `IPv4 address` : `10.210.17.152` (ESXi9B)

## Créer des bases de données
- `Stockage`
  - Renommer la base de donnée `datastore1` en : `system`
- `Nouvelle banque de données`
  - `VMFS`
  - `BDD1-ESXi9A` & `BDD2-ESXi9A`
  - Suivant, terminer

## Uploader des fichiers
- Disque n°1 (`BDD1-ESXi9A`)
  - `Explorateur de banque de données`
  - Créer un répertoir `ISO`
  - Uploader l'ISO Windows Server

## Ajouter une VM
- `Navigateur`
  - `Machines virtuelles`
  - `Créer / Enregistrer une machine virtuelle`
- `Créer une machine virtuelle`
  - `Nom` : `DC9`
  - `Famille de systèmes d'exploitation invités` : `Windows`
  - `Version du SE invité` : `Microsoft Windows Server 2022 (64 bits)`
  - Activer `Activer l'option de Windows Sécurité basée sur la virtualisation`
- Choisir un disque vide (`BDD2-ESXi9A`)
- Dans `Disque dur 1` : Choisir `À provisionnement dynamique`
- Dans `Lecteur de CD/DVD 1` : `Fichier ISO banque de données` : Choisir l'ISO

## Configurer la VM
- IP : `10.210.17.153`
- Gateway : `10.210.17.254`
- DNS : `10.210.17.153`
- Password : `P@ssw0rd`
### DNS
- `Zone de recherche inversé`
- `Nouvelle zone`
- 4x suivant
- ID réseau : `10.210.17`

METTRE A JOUR LE PIR INVERSE ???????

### DNS Directe
- `DNS`, `Zone de recherche directe` : 
  - Ajouter `ESXi9A` et son IP : `10.210.17.151`
  - Et `ESXi9B` `10.210.17.152`
  - `vCenter9` : `10.210.17.154`

## ESXi9B
- Carte réseau `LAN1`,`LAN2`,`LAN3`,`LAN4`

## rejoindre un domaine
- [ESXi9A Gérer / Sécurité utilisateurs / Authentification](https://10.210.17.151/ui/#/host/manage/security/authentication)
- [ESXi9B Gérer / Sécurité utilisateurs / Authentification](https://10.210.17.152/ui/#/host/manage/security/authentication)

- `form9.loc`
- `administrateur`
- `P@ssw0rd`

## ISCSI
- [ESXi9A](https://10.210.17.151/ui/#/host/networking/vswitches)
- [ESXi9B](https://10.210.17.152/ui/#/host/networking/vswitches)

- `Navigateur` > `Mise en réseau`
### Commutateurs virtuels
- `Commutateurs virtuels`
- `Ajouter un commutateur virtuel standard`
  - Créer `vSwitch1` à `vSwitch3` (`LAN2` à `LAN4`)
- ~~Sélectionner les cartes crées, `Modifier le commutateur virtuel standard [...]`~~

## Groupes de ports
- `Groupes de ports`
- `Ajouter un groupe de ports`
  - Créer `Gports-LAN2` sur `LAN2`
  - Faire aussi sur `Gports-LAN3` & `Gports-LAN4`, sur leurs LAN3/4

## IP des cartes
### Connexion réseau PC hôte
- `LAN2` : `10.9.0.10`
  - `255.255.255.0`
- `LAN3` : `10.9.1.10`
  - `255.255.255.0`
- Pas de Gateway ni DNS
## NIC VMKernel
- `NIC VMKernel`
- `Ajouter une NIC VMKernel`
- `LAN2`
- `Paramètres IPv4` : `Statique`
### ESXi9A
- `LAN2` : `10.9.0.20`
  - `255.255.255.0`
- `LAN3` : `10.9.1.20`
  - `255.255.255.0`
- `LAN4` : `10.9.2.20`
  - `255.255.255.0`
- VMotion & Provisonnement
### ESXi9B
- `LAN2` : `10.9.0.30`
  - `255.255.255.0`
- `LAN3` : `10.9.1.30`
  - `255.255.255.0`
- `LAN4` : `10.9.2.30`
  - `255.255.255.0`
- VMotion & Provisonnement

#### Notes
`LAN4` : `10.9.2.20` & `LAN4` : `10.9.2.30` ne peuvent être ping que depuis les ESXi

## ETC
`C:/Windows/drivers/etc/hosts`

```
10.210.17.151		ESXi9A.form9.loc
10.210.17.151		ESXi9A
10.210.17.152		ESXi9B.form9.loc
10.210.17.152		ESXi9B
10.210.17.153		DC9.form9.loc
10.210.17.153		DC9
10.210.17.154		vCenter9.form9.loc
10.210.17.154		vCenter9
```
- `ipconfig /displaydns` Affiche les informations du DNS
- `ping DC9.form9.loc`

## AD fichier de stockage
Sur machine hôte
- `Ajouter des rôles et fonctionnalités`
- `Service de fichier et de stockage`
  - `Fournisseur de stockage cible iSCSI`
  - `Serveur cible iSCSI`

- `Gestionnaire de serveur`
- `Services de fichiers et de stockage`

- `Pour créer un disque virtuel iSCSI, démarrez l'assistant nouveau disque virtuel iSCSI`
ou
`Tâches > Nouveau disque`

- `Tapez un chemin personnalisé`
- `C:/VM`

- `iSCSI9`

- `2To`
- `Taille dynamique`

- `Cible1` (1 par client)

- `Ajouter...`
- `Entrer une valeur pour le tyoe sélectionné`
- ~~`Nom DNS`~~
- ~~`ESXi9a.form9.loc` & `ESXi9b.form9.loc`~~
- UPDATE !!! Voire la suite pour l'IQN à coller dans ce menu !

Ajouter deux autres disques sur la même cible

### iSCSI logiciel
Sur ESXi
- `Navigateur` > `Stockage` > `Adaptateurs`
- `iSCSI logiciel`
- `Activé`
- Copier `Nom et alias` : `iqn.1998-01.com.vmware:esxi9a.form9.loc:2080084877:65`

- Sur Windows Server hôte
- `Gestionnaire de serveur`
- `Services de fichiers et de stockage`
- `iSCSI`
- `Initiateurs`
- Ajouter les noms et alias copiés dans `Entrer une valeur pour le type sélectionné` : `Nom qualifié`

### iSCSI B
Faire la même chose pour le second ESXi `iqn.1998-01.com.vmware:esxi9b.form9.loc:1970347846:65`

### Ajouter l'iSCSI logiciel
- Copier l'IQN de la cible du windows server (Propriété de la cible1) `iqn.1991-05.com.microsoft:tor-08-cible1-target` sur les ESXI dans `Ajouter une cible statique`
- Ajouter l'adresse IP du windows server `10.210.17.58`

- Cliquer sur `Réanalyser` & `Actualiser`

### Ajouter une liaison
- `Navigateur` > `Stockage` > `Adaptateurs`
- `iSCSI logiciel`
- `Ajouter une cible dynamique`
- Ajouter l'adresse IP : `10.9.0.10`, `10.9.1.10`

Faire la même chose sur le second ESXi

### Créer une banque de données
- ESXi9A : `Navigateur` > `Stockage` > `Banques de données`
- Nom : `BDD9-iSCSI`, `BDD9-iSCSI2`, `BDD9-iSCSI3`

- Réactualiser le stockage `esxcli storage core adapter rescan --all` sur chaques ESXi
- Attention si vous relancez un ESXi veillez à relancer le contrôleur de domaine

## vCenter ISO installation
- Sur `C:\VM` `VMware-VCSA-all-7.0.3-23788036`
- Double cliquer
- Un CD va être monté
- Dans le CD `vcsa-ui-installer/win32` lancer `installer`
- `Install` afin de déployer une VM vCenter
- `ESXi host or vCenter Server name` : `ESXi9B.form9.loc`
- `User name` : `root` (Le login de l'ESXi)
- `Password` : `SuperUser11` (Le mot de passe de l'ESXi)

- `VM name` : `vCenter9`
- `Set root password` & `Confirm root password` : `SuperUser11!`

- `BDD9-ISCSi`
- Activer `Enable Thin Disk Mode`

- `FQDN` : `vCenter9.form9.loc`
- `IP address` : `10.210.17.154`
- `Subnet mask or prefix length` : `24`
- `Default gateway` : `10.210.17.254`
- `DNS servers` : `10.210.17.153`

### Finaliser vCenter
- [10.210.17.154:5480](https://10.210.17.154:5480)
- root, SuperUser11!

`Time synchronization mode` : `Synchronize time with ESXi host`
`SSH access` : `Enabled`

- `Single Sign-On domain name` : `vsphere9.loc`
- `Single Sign-On username` : `administrator`
- `Single Sign-On password` : `SuperUser11!`

#### DNS à ajouter test
- TEST, pas sur si c'est la cause du soucis d'installation étape 2
- Carte réseau Altherneum
  - DNS :
    - 10.210.17.153
    - 10.210.40.11

## Se connecter à vCenter ou vSphere
### Se connecter à vCenter server management
- [10.210.17.154:5480](https://10.210.17.154:5480/)
- `root`
- `SuperUser11!`
### Se connecter à vSphere
- [vcenter9.form9.loc](https://vcenter9.form9.loc/)
- `administrator@vsphere9.loc`
- `SuperUser11!`

## Ajout au domaine
### Rejoindre le domaine avec vSphere
https://vcenter9.form9.loc/ui/app/admin/sso-configuration/identity-provider
- `form9.loc`
- `Administrateur`, `P@ssw0rd`

### Source d'identité
- `Ajouter`
  - Ajouter le domaine `form9.loc` et cliquer sur ajouter

- `Utilisateurs et groupes`
  - `Domaine` : Mettre la source sur le domaine `form9.loc`

## Création du cluster
### Créer un datacenter dans vSphere
- `Inventaire`, `Actions` > `Nouveau centre de données...`
  - `Datacenter`

### Ajouter un cluster dans vSphere
- `Clique droit` sur `Datacenter`, `Nouveau cluster`
  - `Cluster`

### Ajouter un ESXi dans vSphere
- `Clique droit` sur `Cluster` > `Ajouter un hôte...`
  - Ajouter son FQDN : `ESXi9A.form9.loc` / `ESXi9B.form9.loc`
  - Utilisateur : `root` et mot de passe : `SuperUser11`

## Migration
### Menu de migration
- `Clique droit` sur le `DC9`, `Migrer`
#### Migrer le stockage d'une VM
- `Modifier uniquement le stockage`
  - Choisir un disque ISCSI (Exemple : `BDD9-iSCSI`)
#### Migrer une VM
- `Modifier uniquement la ressource de calcul`
  - Choisir un hôte dans le cluster (Exemple : `ESXi9B.form9.loc`)

## Haute disponibilité
- `Cluster`
- `Configurer`
### vSphere HA
- `Disponibilité vSphere`
- Bouton `Modifier...`
- Activer `vSphere HA`
### vSphere DRS
- `vSphere DRS`
- Bouton `Modifier`
- Activer `vSphere DRS`
### Ajouter des cartes réseau
- Sur chaque ESXi :
  - `Configurer`
  - `Adaptateurs VMKernel`
  - `vmk3`
    - `Cliquer sur` : `Les trois points` > `Modifier`
    - Ajouter le service `Gestion`
  - `Clique droit` sur l'ESXi en cours de modification
    - `Reconfigurer pour vSphere HA`
#### Notes sur HA
- Attention à la RAM (la migration automatique peut échouer si il n'y en manque)
- Vérifier les logs