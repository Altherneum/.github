# APT Advanced Packaging Tool
[doc.ubuntu-fr.org/apt](https://doc.ubuntu-fr.org/apt)

## Update & upgrade
- `apt update` Permet de resynchroniser un fichier répertoriant les paquets disponibles `/etc/apt/sources.list`
- `apt upgrade` permet d'installer les versions les plus récentes de tous les paquets présents sur le système
- `apt update && apt upgrade` Lance les deux commandes à la suite

## Utiliser APT
- `apt show [NOM]` Afficher les informatons du paquet
- `apt install [NOM]` Télécharger et installer le paquet

## Réparer une installation APT
- `apt --reinstall install [NOM]` Re-Télécharge et re-installer le paquet (Si le système est endommagé)
- `apt --fix-broken  install [NOM]` Répare le paquet (Fonctionne aussi avec remove)

## Désinstaller un paquet APT
- `apt remove [NOM]` Supprimer le paquet
- `apt purge [NOM]` Désinstalle les paquets indiqués et leurs fichiers de configuration