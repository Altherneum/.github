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

## Purger un paquet APT
- `apt purge gitlab` utilisé pour désinstaller un package du système avec ses fichiers de configuration associés
## Autoremove les anciens paquets APT
- `apt autoremove` peut être utilisé pour supprimer les dépendances qui ont été installées avec un package mais qui ne sont plus requises par aucun package installé.
## Lister les paquets APT installés
- `apt list --installed`
## Vérifier la présence de paquet APT
### Vérifier si un paquet APT est installé
- `apt list --installed PACKAGE_NAME`
```
apt list --installed apache2

Listing... Done
apache2/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.15 amd64 [installed]
```
### Vérifier si un paquet APT est installé 2
- `dpkg -s PACKAGE_NAME &>/dev/null && echo "Installed" || echo "Not Installed"`
```
dpkg -s gitlab &>/dev/null && echo "Installed" || echo "Not Installed"

Not Installed
```
```
dpkg -s apache2 &>/dev/null && echo "Installed" || echo "Not Installed"

Installed
```
### Vérifier si un paquet APT est installé 3
- `apt list --installed | grep PACKAGE_NAME`
```
apt list --installed | grep apache


WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

apache2-bin/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.15 amd64 [installed,automatic]
apache2-data/jammy-updates,jammy-updates,jammy-security,jammy-security,now 2.4.52-1ubuntu4.15 all [installed,automatic]
apache2-utils/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.15 amd64 [installed,automatic]
apache2/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.15 amd64 [installed]
libapache-pom-java/jammy,jammy,now 18-1 all [installed,automatic]
libapache2-mod-php8.1/jammy-updates,jammy-security,now 8.1.2-1ubuntu2.22 amd64 [installed,automatic]
```
### Vérifier si un paquet APT exist en ligne
- `apt-cache pkgnames | grep -q "PACKAGE_NAME" && echo "✅" || echo "❌"`
```
apt-cache pkgnames | grep -q "gitlab" && echo "✅" || echo "❌"

✅
```