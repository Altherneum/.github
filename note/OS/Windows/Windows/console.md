
# Console
## Afficher du texte
- `@echo off` Pour empêcher l’affichage de toutes les commandes d’un fichier de traitement par lots (y compris la commande écho désactivé) à l’écran, sur la première ligne du type de fichier de traitement par lots
- `echo off` Pour empêcher l’écho des commandes à l’invite de commande
- `echo text` Affiche "text"
- `echo %random%` Chiffres aléatoires

## Historique
- `F7` Affiche l'historique des commandes
  - `Alt + F7` Supprime l'historique des commandes
- `F9` Permet de recharger une commande par son n°
- `F7 + F9`
- `F8` Commandes précédentes
- `doskey /History` Affiche l'historique de commande

## Go to
- `:Text` Crée le début d'une boucle nommé 'Text'
- `goto :Text` Le code va exécuter la boucle 'Text'

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

## Run as
- `RunAs` (Lance une commande en tant que)
  - De préférance sans charger le profil Windows `/noprofile`

## Dossiers
- `dir` Liste les dossiers et fichiers
- `copy [path\file.ext] [path\newfile.ext]` Copier & Coller
- `del [path\file.ext]` Supprimer
- `cd [chemin]` permet de se déplacer dans la structure de dossier
- `cd ..` retour en arrière d'un dossier
- `tree` Affiche graphiquement la structure des répertoires d’un chemin ou du disque d’un lecteur
- `dir` Affiche le dossier et ses fichiers

- `notepad` Ouvre notepad
- `notepad [FILE]` Ouvre notepad sur le fichier

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
  - `ipconfig /displaydns` Affiche les informations du DNS

### Netstat
- `netstat -aon` Affiche les données détaillées des sockets actifs
- `netstat -na | more` Affiche toutes les connexions et tous les ports d'écoute, les adresses et numéros de ports seront affichés en format numérique

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

## Licence
- `slmgr` Détail de license Windows
- Ces commandes doivent être obligatoirement tapées dans la console
  - `slmgr -xpr` Affiche si la license Windows est active
  - `slmgr -dli` Affiche le détail de la license Windows
  - `slmgr dlv` Affiche tout les détailes de license

## Global policy
- `gpupdate /force` Met à jour les paramètres de la stratégie de groupe
- `gpresult /r` Affiche les informations de stratégie résultant

### Windows key
- [WinKeyDump.vbs](https://github.com/Altherneum/.github/blob/main/note/OS/Windows/Scripts/WinKeyDump.vbs)

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
  - `tasklist /svc` Liste des processus crée par SVCHost
  - `taskkill /f /im [process name]` Tuer un processus par le nom
  - `taskkill /f /pid [process ID]` Tuer un processus par son ID