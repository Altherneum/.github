# Linux
**Bienvenue au cours "Linux pour débutants"**

Dans ce cours exhaustif, nous allons couvrir un large éventail de sujets liés à l'utilisation de Linux, des bases aux fonctionnalités avancées et aux pratiques recommandées. À la fin de ce cours, vous serez bien équipé pour aborder la plupart des tâches sur votre système Linux.

## Introduction au Linux
- [Qu'est-ce que Linux ?](#Quest-ce-que-Linux-?)
- [Histoire du Linux](#Histoire-de-Linux)
- Principales différences entre le Linux et d'autres systèmes d'exploitation (par exemple, [Linux vs Windows vs macOS](#Linux-vs-Windows-vs-macOS))
- [Avantages de l'utilisation de Linux](#Avantages-de-lutilisation-de-Linux)

## Installation et configuration
- Installer Linux sur un ordinateur
- Installer Linux sur une machine virtuelle
- Informations système
  - `hostname`
  - [Afficher la version de l'OS](#Afficher-la-version-de-lOS)
  - [MOTD](#MOTD)
  - [uptime](#Uptime)
  - [free RAM](#free-RAM)
  - [Top processus](#Top-processus)


## Gestion des services et scripts
- [Gestion des services](#Systemctl)
- [Jobs](#Jobs)
- [Variables](#Variables) et [variables spéciales](#Variables-spéciales)
- Mathématiques
  - [Expr](#Expr)
  - [BC](#BC)
  - [Let](#Let)
  - [Double parenthèse](#Double-parenthèse)
- [Alias de commande](#Alias)
- Scripts et [Shebang](#Shebang)
  - Conditions et boucles
- [Fichiers utiles](#Fichiers-utiles)
- Vérifier les [process statuses](#Process-statuses) et leurs [PIDof](#PIDof) pour [tuer un processus](#Tuer-un-processus)

## Navigation du système de fichiers
- Compréhension de la structure de fichiers Linux :
  - Répertoire racine (`/`)
  - Répertoires d'ordinateur domicile (`~username/`)
  - Répertoires systèmes (`/usr/`, `/var/`, etc.)
  - Liens symboliques
- Création et gestion des fichiers et des répertoires
  - [Créer un dossier](#Créer-un-dossier)
  - `rm` [...]()
    - [Supprimer-un-dossier](#Supprimer-un-dossier)
  - Créer une archive via [tar](#tar)
- Commandes de base pour gérer les fichiers et les répertoires
  - [Copy paste](#Copy-paste)
  - [Move file](#Move-file)
- Navigation
  - [Changer de dossier](#Changer-de-dossier)
  - [Lister les fichiers](#Lister-les-fichiers)
  - [Afficher le chemin actuel](#Afficher-le-chemin-actuel)
- Gestion des fichiers et des répertoires avec les outils de ligne de commande
  - [Écrire un fichier](#Écrire-un-fichier)
  - [Écrire sur un fichier](#Écrire-sur-un-fichier)
  - [Lire un fichier](#Lire-un-fichier)
  - `find`
  - `grep`

## Sécurité et gestion des utilisateurs
- Sécurité basique sur le Linux :
  - Droits d'accès et [permissions](#Permission)
  - Utilisation de [sudo](#Sudo) et de [su](#SU---Super-User)
- Gestion des utilisateurs et des groupes :
  - [Création](#Add-user), [modifier](#Edit-user), [supprimer](#Delete-user), ou [ajouter des groupes secondaires](#Ajouter-des-groupes-secondaires) des utilisateurs
  - [Créer](#Add-Group), [modifier](#Edit-group) et [supprimer](#Delete-group) des groupes
  - [Changer les mots de passe](#Changer-les-mots-de-passes)
- [Liste des utilisateurs](#Who) et [qui suis-je](#Whoami) ?

## Gestion des paquets et des dépendances
- Introduction aux gestionnaires de paquets
  - [APT Advanced Packaging Tool](#APT-Advanced-Packaging-Tool)
  - `pacman`
  - `yum`
- Gestion des dépendances et des conflicts entre paquets

## Réseau et internet
- Configuration réseau de base :
  - Établissement d'une connexion Wi-Fi ou Ethernet
  - Paramétrage du serveur DHCP et du routeur
- Introduction aux outils de réseau
  - `ping`
  - `traceroute`
  - [informations réseau](#Netstat)
- Accès à Internet avec le Linux :
  - Installation des pilotes pour la carte réseau
  - Configuration du proxy HTTP/HTTPS
  - Utiliser [SSH](#SSH)
  - Pare-feu [UFW](#UFW)
- Télécharger depuis internet
  - [Télécharger](#Wget)
  - [Secure Copy Protocol](#SCP)

## Méthodes de sauvegarde et de restauration
- Introduction aux méthodes de sauvegarde :
  - Sauvegarde des fichiers
  - Sauvegarde du système
- Restauration d'un système sauvegardé :
  - Mise en place d'une sauvegarde
  - Utilisation de la commande `fsck` pour restaurer un système

## Solutions aux problèmes courants
- Résolution de problèmes communs sur le Linux :
  - Erreurs de connexion réseau
  - Problèmes de sécurité
  - Erreurs d'installation de paquets
- Méthodes de résolution de problèmes avancées :
  - Utilisation des journaux de système (par exemple, `/var/log/syslog`)
  - Analyse des erreurs avec les outils de debug (par exemple, `strace`)
