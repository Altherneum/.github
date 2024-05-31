# Admin
- `sudo` Run as super user (root)
- `sudo su` Super User

# APT Advanced Packaging Tool
[doc.ubuntu-fr.org/apt](https://doc.ubuntu-fr.org/apt)
- `apt update` Permet de resynchroniser un fichier répertoriant les paquets disponibles `/etc/apt/sources.list`
- `apt upgrade` permet d'installer les versions les plus récentes de tous les paquets présents sur le système
- `apt show {nom}` Afficher les informatons du paquet
- `apt install {nom}` Télécharger et installer le paquet
- `apt remove {nom}` Supprimer le paquet
- `apt --reinstall install {nom}` Re-Télécharge et re-installer le paquet (Si le système est endommagé)
- `apt --fix-broken  install {nom}` Répare le paquet (Fonctionne aussi avec remove)
- `apt purge {nom}` Désinstalle les paquets indiqués et leurs fichiers de configuration

# Folder
- `cd ..` se déplacer vers le dossier précédent
- `cd /folder` se déplacer vers le dossier "folder"

- `ls` liste des dossiers et fichiers

![ssh ls of main folder](https://github.com/Altherneum/.github/assets/84735589/1dc14cb5-dac3-419a-9769-d2f357e81821)

## Copy paste
- `cp [à copier] [déstination]` Permet de copier un ou plusieurs fichiers vers un emplacement spécifié
- `cp [fichier à copier] [dossier à copier] [fichier à copier] [dossier à copier] [déstination]` Permet de copier une liste de dossiers et fichiers vers l'emplacement spécifié
- `cp -f [fichier] [déstination]` Permet de forcer l'écrasement d'anciens fichiers et dossiers
- `cp -a [fichier] [déstination]` Permet de conserver les mêmes droits et métadonnées que le fichier d’origine
- `cp -r [dossier] [déstination]` Permet de copier de manière récursive
- `cp -s [fichier] [déstination]` Permet de créer un lien symbolique vers le fichier d’origine.

# Top process
- `top`

![ssh top](https://github.com/Altherneum/.github/assets/84735589/e7e272f8-3da0-4ca9-a531-391a38c27ea9)

# free RAM

- `free` affiche l'utilisation de la RAM
- `free --mega` affiche en méga octet (Fonctionne aussi avec `--giga`)

![ssh free](https://github.com/Altherneum/.github/assets/84735589/4817a67a-97d9-4a29-9e72-a00d2818800f)

# Process statuses
- `ps` Permet de lister les processus en cours
- L’option `ps a` affiche tous les processus en cours d’exécution de tous les utilisateurs du système
- L’option `ps u` fournit des informations supplémentaires telles que le pourcentage d’utilisation de la mémoire et du CPU, le code d’état du processus et le propriétaire des processus
- L’option `ps x` Liste de tous les processus qui ne sont pas exécutés à partir du terminal
- Les options peuvent être cumulés `ps aux`
- L'option `ps -u [User]` Liste les processus d'un utilisateur
- `ps -T` Liste les processus actifs à partir du terminal
- `ps -C [Nom]` Liste les processus en filtrant par nom

# Modifier du texte
- `nano [Fichier]` Ouvre l'éditeur de texte nano  
`ctrl+x` Permet de fermer nano
`ctrl+o` Permet de sauvegarder le fichier
---
- `vi [Fichier]` Ouvre l'éditeur de texte vi