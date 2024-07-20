# Commandes
## Admin
- `sudo` Run as super user (root)
- `sudo su` Super User

## Password
- `passwd` Outils de changements des mots de passe
  - `passwd [Utilisateur]` Change le mot de passe de l'utilisateur, va demander le mot de passe actuel
  - `sudo passwd [Utilisateur]` Change le mot de passe de l'utilisateur via le compte root, ne demandera pas le mot de passe actuel

### Récupération de compte root
[gcore.com/learning/how-to-reset-password-in-linux/](https://gcore.com/learning/how-to-reset-password-in-linux/)



## Folder
- `cd ..` se déplacer vers le dossier précédent
- `cd /folder` se déplacer vers le dossier "folder"

- `ls` liste des dossiers et fichiers
- `pwd` Affiche le chemin actuel

![ssh ls of main folder](https://github.com/Altherneum/.github/assets/84735589/1dc14cb5-dac3-419a-9769-d2f357e81821)

### Copy paste
- `cp [à copier] [déstination]` Permet de copier un ou plusieurs fichiers vers un emplacement spécifié
- `cp [fichier à copier] [dossier à copier] [fichier à copier] [dossier à copier] [déstination]` Permet de copier une liste de dossiers et fichiers vers l'emplacement spécifié
- `cp -f [fichier] [déstination]` Permet de forcer l'écrasement d'anciens fichiers et dossiers
- `cp -a [fichier] [déstination]` Permet de conserver les mêmes droits et métadonnées que le fichier d’origine
- `cp -r [dossier] [déstination]` Permet de copier de manière récursive
- `cp -s [fichier] [déstination]` Permet de créer un lien symbolique vers le fichier d’origine.

# Autres commandes
## Top process
- `top`

![ssh top](https://github.com/Altherneum/.github/assets/84735589/e7e272f8-3da0-4ca9-a531-391a38c27ea9)

## free RAM

- `free` affiche l'utilisation de la RAM
- `free --mega` affiche en méga octet (Fonctionne aussi avec `--giga`)

![ssh free](https://github.com/Altherneum/.github/assets/84735589/4817a67a-97d9-4a29-9e72-a00d2818800f)

## Process statuses
- `ps` Permet de lister les processus en cours
- L’option `ps a` affiche tous les processus en cours d’exécution de tous les utilisateurs du système
- L’option `ps u` fournit des informations supplémentaires telles que le pourcentage d’utilisation de la mémoire et du CPU, le code d’état du processus et le propriétaire des processus
- L’option `ps x` Liste de tous les processus qui ne sont pas exécutés à partir du terminal
- Les options peuvent être cumulés `ps aux`
- L'option `ps -u [User]` Liste les processus d'un utilisateur
- `ps -T` Liste les processus actifs à partir du terminal
- `ps -C [Nom]` Liste les processus en filtrant par nom

## Services statuses
- `Systemctl`

# Modifier du texte
- `nano [Fichier]` Ouvre l'éditeur de texte nano  
`ctrl+x` Permet de fermer nano
`ctrl+o` Permet de sauvegarder le fichier
---
- `vi [Fichier]` Ouvre l'éditeur de texte vi