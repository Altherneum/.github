cours sur Windows

# Raccourcis
- `Win + R` Recherche ou commande
- `Win + V` Historique des copier / coller
- `Win + E` Explorateur de fichiers

- `Win + ;` Liste des émojis

- `Win + ➡` Déplacer la fenêtre sélectionnée

- `Windows + ↹` Changer de fenêtre
- `Windows + ↑ Shift` Changer de fenêtre en arrière

- `Control + Descendre/Monter la molette de souris` Gestion du zoom

- `Control + Z` Annuler / Retour en arrière

- `Control + F` Rechercher
- `Control + H` Remplacer

- `↹`, `↑ Shift + ↹` Se déplacer dans un champ de saisie/bouton suivant/précédent
- `Control + Alt + Suppr` Menu de secours pour la gestion Windows

- `Impr Ecran Syst` Capture d'écran
- `Win + ↑ Shift + S` Capture d'écran avec zone

- `Control`+ `Shift` + `Lancer une application` Pour démarrer en tant qu'administrateur

- `Windows` + `PAUSE` Ouvrir les informations systèmes
- `Windows` + `Z` Placer toutes vos fenêtres suivant des modèles
  - Windows 11 +
- `Windows` + `G` Ouvrir la game barre 

# TaskManager
- Raccourcis `Ctrl Alt Suppr`, `TAB` `Entrée`

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

# Installation via ISO
## Télécharger l'ISO
- [microsoft.com /.../ windows10ISO](https://www.microsoft.com/fr-fr/software-download/windows10ISO)
- [microsoft.com /.../ windows-server-2022](https://www.microsoft.com/fr-fr/evalcenter/evaluate-windows-server-2022)

## Déplacer l'ISO sur un support
- Clef USB / réseau (server de mastering) / CD, ...
### Intune
- [learn.microsoft.com /.../ what-is-intune](https://learn.microsoft.com/fr-fr/mem/intune/fundamentals/what-is-intune)
### Etcher
- [etcher.balena.io](https://etcher.balena.io/)
- [github.com / balena-io / etcher](https://github.com/balena-io/etcher)
### Rufus
- [rufus.ie](https://rufus.ie/fr/)
- [github.com / pbatard /rufus](https://github.com/pbatard/rufus)
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
Hors réseau = pas de demande de compte Microsoft

## IExpress
- Composant de Windows 2000 et des versions ultérieures du système d'exploitation, est utilisé pour créer des packages auto-extractibles à partir d'un ensemble de fichiers. 
- Ces packages peuvent être utilisés pour installer des logiciels.
- `iexpress.exe`, `C:\Windows\System32`
- [Youtube / John HAMMOND / Self-Extracting Executables for Hackers](https://www.youtube.com/watch?v=mAond4BkCfM)
