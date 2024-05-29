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

# RAM usage
- `top`

![ssh top](https://github.com/Altherneum/.github/assets/84735589/e7e272f8-3da0-4ca9-a531-391a38c27ea9)

- `free` affiche l'utilisation de la RAM
- `free --mega` affiche en méga octet (Fonctionne aussi avec `--giga`)
![ssh free](https://github.com/Altherneum/.github/assets/84735589/4817a67a-97d9-4a29-9e72-a00d2818800f)