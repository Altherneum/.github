Cours sur Windows technique

# Workgroup vs Active directory
## Workgroup
- Libre d'entrée
- Plusieurs PC connectés ensemble
- Partage les ressources que de la "cible" que vous demandez (Avec authentification)
- Tout est décentralisé sur chaque poste (Authentification) ce qui surcharge (Comme à partir de 10 postes)

## Active directory
- Serveur gère le domaine de PC
- Centralise (Authentification comme fichiers ou règles de domaine)
- Partage l'ensemble des ressources à tout le monde (Une seul authentification pour tout le réseau)

# Installation de Windows
## Télécharger l'ISO
### Téléchargement via Microsoft
#### Windows Desktop OS
- [microsoft.com /.../ windows10ISO](https://www.microsoft.com/fr-fr/software-download/windows10ISO)
- [microsoft.com /.../ windows11ISO](https://www.microsoft.com/fr-fr/software-download/windows11)
#### Windows Server OS
- [microsoft.com /.../ windows-server-2022](https://www.microsoft.com/fr-fr/evalcenter/evaluate-windows-server-2022)
- [microsoft.com /.../ windows-server-2025](https://www.microsoft.com/fr-fr/evalcenter/evaluate-windows-server-2025)
### Déplacer l'ISO sur un support
- Clef USB / réseau (server de mastering) / CD, ...
#### Déplacer l'ISO via les outils Microsoft
- Si vous utilisez l'étape du [#Téléchargement via Microsoft](#Téléchargement-via-Microsoft) vous pourrez créer un support USB via cet outil
#### Déplacer l'ISO via d'autres outils
### Etcher
- [etcher.balena.io](https://etcher.balena.io/)
- [github.com / balena-io / etcher](https://github.com/balena-io/etcher)
### Rufus
- [rufus.ie](https://rufus.ie/fr/)
- [github.com / pbatard /rufus](https://github.com/pbatard/rufus)

## Réinitialiser sans ISO
[microsoft.com /.../ réinitialiser-votre-pc](https://support.microsoft.com/fr-fr/windows/réinitialiser-votre-pc-0ef73740-b927-549b-b7c9-e6f2b48d275e)
### Menu réinitialiser ce PC
- Touche `⊞ Windows` et écrire `Réinitialiser ce PC`
### Menu d'administration de récupération
- [microsoft.com /.../ environnement-de-récupération-windows](https://support.microsoft.com/fr-fr/windows/environnement-de-récupération-windows-0eb14733-6301-41cb-8d26-06a12b42770b)
  - [microsoft.com /.../ hold-shift-key-shutting-down-not-disable-automatic-logon](https://learn.microsoft.com/fr-fr/troubleshoot/windows-client/user-profiles-and-logon/hold-shift-key-shutting-down-not-disable-automatic-logon)

## Autres méthodes
### Intune
- [learn.microsoft.com /.../ what-is-intune](https://learn.microsoft.com/fr-fr/mem/intune/fundamentals/what-is-intune)
### WDS
- [learn.microsoft.com /.../ windows-deployment-services-portal](https://learn.microsoft.com/fr-fr/windows/win32/wds/windows-deployment-services-portal)
### SysPrep
- [learn.microsoft.com /.../ sysprep--generalize--a-windows-installation](https://learn.microsoft.com/fr-fr/windows-hardware/manufacture/desktop/sysprep--generalize--a-windows-installation)

## BIOS
- Booter d'ISO vs auto setup
### Touches du BIOS
- touche `F1` à `F12`
- peut-être la touche `Suppr`
### Boot order
- Le boot order signifie l'ordre de démarrage des supports de stockage
- Dès qu'un système compatible est chargé il est lancé (Système, comme outil)

## Setup
### Configuration IP
- `Explorateur de fichiers`
- Clique droit sur `Réseau`
- Menu : `Propriétés`
- Carte réseau `Ethernet` / `WiFi`
- Menu : `Propriétés`
- Cliquer sur `IPv4`, et à nouveau le menu `Propriétés`

- voir [Cours / IP](https://doc.altherneum.fr/cours/ip), [Cours / Network](https://doc.altherneum.fr/cours/network)

### Astuces
#### Installation hors réseau
Hors réseau = pas de demande de compte Microsoft
#### Installation OOBE
Sur le menu d'installation : `Shift` + `F10`, et lancer la commande `OOBE\BYPASSNRO` pour relancer l'ordinateur en mode (W)OOBE (Windows) "Out of Box Experience"

![Image de OOBE](https://github.com/Altherneum/.github/blob/main/note/assets/images/0dc02787-ce2e-4dac-858e-d74cd2d98ed5.png?raw=true)

## MicroSoft OpenJDK build
- [learn.microsoft.com /fr-fr /java](https://learn.microsoft.com/fr-fr/java/)
  - [learn.microsoft.com /fr-fr/ java /openjdk /download](https://learn.microsoft.com/fr-fr/java/openjdk/download)

## IExpress
- Composant de Windows 2000 et des versions ultérieures du système d'exploitation, est utilisé pour créer des packages auto-extractibles à partir d'un ensemble de fichiers. 
- Ces packages peuvent être utilisés pour installer des logiciels.
- `iexpress.exe`, `C:\Windows\System32`
- [Youtube / John HAMMOND / Self-Extracting Executables for Hackers](https://www.youtube.com/watch?v=mAond4BkCfM)

## Raccourcis
## .URL
- Créer un fichier `<NOM>.URL`
- Modifier le contenu avec :
```
[InternetShortcut]
URL=https://google.fr
```

## Lien WEB
- Créer un raccourci
- Rentrer une URL (Exemple : `https://github.com/Altherneum/.github/`)
- Saisir le nom du raccourci et valider
