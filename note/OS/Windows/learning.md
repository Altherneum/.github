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
Pour modifier la couleur d’arrière-plan de la fenêtre d’invite de commandes en gris et la couleur de premier plan en rouge, tapez : `color 84`
- `exit` ferme la console
- `whoami` affiche le nom d'utilisateur

## Dossiers
- `dir` Dossiers et fichiers
- `copy [path\file.ext] [path\newfile.ext]` Copier & Coller
- `del [path\file.ext]` Supprimer
- `cd [chemin]` permet de se déplacer dans la structure de dossier
- `cd ..` retour en arrière d'un dossier

## Disques
- `sfc /scannow` scan le système Windows
- `chkdsk /f` vérifie l’intégrité des fichiers système
- `chkdsk /f C:` vérifie l’intégrité des fichiers système du disque C:
- `format [drive letter]: /fs:[file system] /q` Formatter un disque, ex : `format h: /fs:ntfs /q`
- `diskpart` disques et outils de formatage

## Réseau
- `ipconfig` Configuration IP
- `ipconfig /all` Configuration IP totale
- `ipconfig /flushdns` Vide le cache DNS
- `ipconfig /registerdns` Actualise tous les baux DHCP et réinscrit les noms DNS
- `ipconfig /release` Libère les connexions
- `ipconfig /renew` Rétablit les connexions

---

- `ping [IP/DNS]` Envoie un paquet IP
- `tracert [IP/DNS]` Trace la route des rebonds d'un paquet IP

---

- `arp` Affiche et modifie les entrées dans le cache ARP
- `arp /a` Affiche les tables de cache ARP de toutes les interfaces
- `arp /a /n 10.0.0.99` Pour afficher la table de cache ARP de l’interface à laquelle est attribuée l’adresse IP 10.0.0.99
- `arp /s 10.0.0.80 00-AA-00-4F-2A-9C` Pour ajouter une entrée de cache ARP statique qui résout l’adresse IP 10.0.0.80 en adresse physique 00-AA-00-4F-2A-9C

---

- `nslookup` Affiche des informations que vous pouvez utiliser pour diagnostiquer l’infrastructure DNS (Domain Name System)
- `nslookup mydomain.com 1.1.1.1` Recherche les adresses IP du nom de domaine mydomain.com sur le serveur de noms DNS à 1.1.1.1
- `nslookup 4.4.4.4` Recherche le nom de domaine de l’adresse IP 4.4.4.4 sur le serveur de noms DNS par défaut
- `nslookup -type=AAAA mydomain.com` Retourne uniquement les types d’enregistrements IPv6
- `nslookup -debug -type=A+AAAA -nosearch -recurse mydomain.com 1.1.1.1` Vous pouvez combiner des options et des requêtes de type d’enregistrement de ressource.   
L’exemple active la sortie de débogage, récupère les adresses IPv6 et IPv4, ne tente pas d’utiliser le domaine de recherche, utilise la recherche récursive et utilise le serveur de recherche DNS 1.1.1.1

---

`ftp` Lance le mode transfert de fichier

## Système
- `systemInfo` Information système
- `hostname` Le nom de l’hôte actuel
- `shutdown /s` Arrête le système
- `logoff` Déconnecte le compte Windows
- `ver` Version du système
- `gpupdate /force` Met à jour les paramètres de la stratégie de groupe

## Task
- `tasklist` Liste des processus
- `taskkill /f /im [process name]` Tuer un processus par le nom
- `taskkill /f /pid [process ID]` Tuer un processus par son ID

# TaskManager
- Raccourcis `Ctrl Alt Suppr`, `TAB` `Entrée`

# ActiveDirectory

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
### Astuces
Hors réseau = pas de demande de compte Microsoft
