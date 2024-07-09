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

- `↹`, `↑ Shift + ↹` Se déplacer dans un champ de saisie/bouton suivant/précédent
- `Control + Alt + Suppr` Menu de secours pour la gestion Windows

- `Impr Ecran Syst` Capture d'écran
- `Win + ↑ Shift + S` Capture d'écran avec zone

# Console
- `@echo off` Pour empêcher l’affichage de toutes les commandes d’un fichier de traitement par lots (y compris la commande écho désactivé) à l’écran, sur la première ligne du type de fichier de traitement par lots
- `echo off` Pour empêcher l’écho des commandes à l’invite de commande
- `echo text` Affiche "text"

- `:Text` Crée le début d'une boucle nommé 'Text'
- `goto :Text` Le code va exécuter la boucle 'Text'
`%random%` Chiffres aléatoires
- `color [couleurs]` Couleur du text ou de l'arrière plan  
  - `color 84` Fond Gris, text rouge
  - `color 2` text vert
- `exit` ferme la console
- `powershell.exe` | `powershell` Console PowerShell
- `prompt` Modifie le text affiché dans la console
  - `prompt $d - $t $p$g` : 07/07/2024 - 22:47:04,44 C:\Users\User>
  - `prompt $p$g` : C:\Users\User>
- `CMD` Invite de commande
  - `CMD /c [Commande]` Exécute la commande puis se termine.

## Dossiers
- `dir` Dossiers et fichiers
- `copy [path\file.ext] [path\newfile.ext]` Copier & Coller
- `del [path\file.ext]` Supprimer
- `cd [chemin]` permet de se déplacer dans la structure de dossier
- `cd ..` retour en arrière d'un dossier
- `tree` Affiche graphiquement la structure des répertoires d’un chemin ou du disque d’un lecteur


## Disques
- `sfc /scannow` scan le système Windows
- `chkdsk /f` vérifie l’intégrité des fichiers système
- `chkdsk /f C:` vérifie l’intégrité des fichiers système du disque C:
- `format [drive letter]: /fs:[file system] /q` Formatter un disque, ex : `format h: /fs:ntfs /q`
- `diskpart` disques et outils de formatage

## Réseau
- `ncpa.cpl` Ouvre l'interface des connexions réseau
- `ipconfig` Configuration IP
- `ipconfig /all` Configuration IP totale
- `ipconfig /flushdns` Vide le cache DNS
- `ipconfig /registerdns` Actualise tous les baux DHCP et réinscrit les noms DNS
- `ipconfig /release` Libère les connexions
- `ipconfig /renew` Rétablit les connexions

### Netstat
- `netstat -aon` Affiche les données détaillées des sockets actifs

### netsh WiFi key
- `netsh wlan show profile` Liste les réseaux auxquels l'ordinateur s'est déjà connecté
- `netsh wlan show profile "WiFi ABC" key=clear` Affiche les clefs WiFi pour le réseau “WiFi ABC“
- `for /f "skip=9 tokens=1,2 delims=:" %i in ('netsh wlan show profiles') do @echo %j | findstr -i -v echo | netsh wlan show profiles %j key=clear` Affiche tous les mots de passe Wi-Fi auxquels l'ordinateur s'est déjà connecté

## ICMP
- `ping [IP/DNS]` Envoie un paquet IP
- `ping -t [IP/DNS]` Envoie un paquet IP à l'infinie
- `tracert [IP/DNS]` Trace la route des rebonds d'un paquet IP

## ARP
- `arp` Affiche et modifie les entrées dans le cache ARP
- `arp /a` Affiche les tables de cache ARP de toutes les interfaces
- `arp /a /n 10.0.0.99` Pour afficher la table de cache ARP de l’interface à laquelle est attribuée l’adresse IP 10.0.0.99
- `arp /s 10.0.0.80 00-AA-00-4F-2A-9C` Pour ajouter une entrée de cache ARP statique qui résout l’adresse IP 10.0.0.80 en adresse physique 00-AA-00-4F-2A-9C

## nslookup DNS
- `nslookup` Affiche des informations que vous pouvez utiliser pour diagnostiquer l’infrastructure DNS (Domain Name System)
- `nslookup mydomain.com 1.1.1.1` Recherche les adresses IP du nom de domaine mydomain.com sur le serveur de noms DNS à 1.1.1.1
- `nslookup 4.4.4.4` Recherche le nom de domaine de l’adresse IP 4.4.4.4 sur le serveur de noms DNS par défaut
- `nslookup -type=AAAA mydomain.com` Retourne uniquement les types d’enregistrements IPv6
- `nslookup -debug -type=A+AAAA -nosearch -recurse mydomain.com 1.1.1.1` Vous pouvez combiner des options et des requêtes de type d’enregistrement de ressource.   
L’exemple active la sortie de débogage, récupère les adresses IPv6 et IPv4, ne tente pas d’utiliser le domaine de recherche, utilise la recherche récursive et utilise le serveur de recherche DNS 1.1.1.1

## FTP
`ftp` Lance le mode transfert de fichier

## Système
- `systemInfo` Information système
- `hostname` Le nom de l’hôte actuel
- `whoami` affiche le nom d'utilisateur
- `shutdown /s` Arrête le système
- `logoff` Déconnecte le compte Windows
- `ver` Version du système
- `sysdm.cpl` Propriétés système

## Global policy
- `gpupdate /force` Met à jour les paramètres de la stratégie de groupe
- `gpresult /r` Affiche les informations de stratégie résultant

### Windows key
- [WinKeyDump.vbs](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/WinKeyDump.vbs)

## Shutdown
- `shutdown /i` Afficher l’interface utilisateur graphique (GUI) de shutdown
- `shutdown -s -t [secondes]` Arrête l'ordinateur dans x secondes
- ~~`shutdown -h -t [secondes]` Met en veille l'ordinateur dans x secondes~~ L'argument -h existe mais ne fonctionne pas
- `timeout /t [secondes]&&rundll32.exe powrprof.dll,SetSuspendState Sleep` Met en veille l'ordinateur dans x secondes
- Scripts BAT de mise en veille : [sleep.bat](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/Scripts/sleep.bat)
```
@echo off
set /p "min=Nombres de minutes : "
set /a sec="min*60"
echo Mise en veille dans %min% minutes (%sec% secondes)
timeout /t %sec%&&rundll32.exe powrprof.dll,SetSuspendState Sleep
```
## Task
- `tasklist` Liste des processus
- `taskkill /f /im [process name]` Tuer un processus par le nom
- `taskkill /f /pid [process ID]` Tuer un processus par son ID

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
- [microsoft.com/fr-fr/software-download/windows10ISO](https://www.microsoft.com/fr-fr/software-download/windows10ISO)
- Liens ISO autre bientôt...

## Déplacer l'ISO sur un support
- Clef USB / réseau (server de mastering) / CD, ...

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
