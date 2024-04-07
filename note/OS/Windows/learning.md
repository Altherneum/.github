cours sur Windows

# Raccourcis
- `Win + R` Recherche ou commande
- `Win + V` Historique des copier / coller
- `Win + E` Explorateur de fichiers
- `Win + ➡` Déplacer la fenêtre sélectionnée
- `Windows + ↹` Changer de fenêtre
- `Windows + ↑ Shift` Changer de fenêtre en arrière
- `Control + Descendre/Monter la molette de souris` Gestion du zoom
- `Control + Z` Annuler / Retour en arrière
- `↹`, `↑ Shift + ↹` Se déplacer dans un champ de saisie/bouton suivant/précédent
- `Control + Alt + Suppr` Menu de secours pour la gestion Windows

# Console
- `Echo` Affiche du text
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
- `ipconfig` configuration IP
- `ping [IP/DNS]` Envoie un paquet IP
- `tracert` Trace la route des rebonds d'un paquet IP

## Système
- `systemInfo` Information système
- `shutdown /s` Arrête le système
- `logoff` Déconnecte le compte Windows
- `ver` Version du système
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
