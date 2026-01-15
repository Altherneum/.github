# Arch linux
[wiki.archlinux.org /title /Installation_guide](https://wiki.archlinux.org/title/Installation_guide)
## Download
Choisir un mirroir ou par torrent sur [archlinux.org/download](https://archlinux.org/download/)
- Exemple de mirroir : [geo.mirror.pkgbuild.com/iso/latest/](https://geo.mirror.pkgbuild.com/iso/latest/)
  - [/archlinux-x86_64.iso](https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso)
  - [/sha256sums.txt](https://geo.mirror.pkgbuild.com/iso/latest/sha256sums.txt)

## Hasher l'ISO
Vérifier le hash via [archlinux.org/iso/latest/sha256sums.txt](https://archlinux.org/iso/latest/sha256sums.txt)
- Windows : `certutil -hashfile C:\Users\%USERNAME%\Downloads\archlinux-x86_64.iso SHA256`
- Linux : `sha256sum ~/Downloads/archlinux-x86_64.iso`

## Préparer l'ISO
Pour installer l'ISO sur une clef USB

### Windows
#### Télécharger Rufus
[rufus.ie](https://rufus.ie/fr/)
- [github.com/pbatard/rufus/releases/latest](https://github.com/pbatard/rufus/releases/)
#### Choix sur Rufus
##### Rufus 3.0+
- Pour Rufus version 3.0 ou ultérieure
  - sélectionnez `Schéma de partition GPT pour UEFI` dans le menu déroulant
##### Ancienne version de Rufus
- Pour les versions antérieures à la version 3.0, 
  - Sélectionnez `Mode image DD` dans le menu déroulant du bas
#### Choix des paramètres Rufus
- Cliquez sur le bouton `SÉLECTIONNER` à côté de `Sélection de démarrage` et choisissez le fichier ISO Arch Linux téléchargé
- Sélectionnez la clé USB cible dans la liste `Périphérique`
  - Assurez-vous de sélectionner le bon lecteur pour éviter toute perte de données
![rufus image](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/rufus-4.9p_86pvWugyZi.png)
#### Lancer la création via Rufus
- Cliquez sur le bouton `DÉMARRER`
##### Confirmer la création
###### Création en mode ISO via Rufus 3.0+
![rufus image](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/arch-iso.png)
###### Création en mode DD Rufus ancienne version
![rufus image](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/arch-dd.png)
##### Finaliser la création de la clef USB
![rufus image](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/rufus-finish.png)
- Rufus gravera l'image d'Arch sur la clé USB
  - Cette opération peut prendre plusieurs minutes
- Une fois terminée, la clé USB sera bootable pour l'installation d'Arch Linux
![rufus image](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/rufus-4.9p_EFz6cUT7Y9.png)

### Linux
#### Lister les disques
- `lsblk`
#### Créer une clef USB bootable
- Remplacez `/dev/sdX` par la clef USB à utiliser
- Remplacez `archlinux-version-x86_64.iso` par l'ISO à utiliser
##### Créer la clef via cat
- `cat path/to/archlinux-version-x86_64.iso > /dev/sdX`
##### Créer la clef via cp
- `cp path/to/archlinux-version-x86_64.iso /dev/sdX`
##### Créer la clef via dd
- `dd bs=4M if=path/to/archlinux-version-x86_64.iso of=/dev/sdX conv=fsync oflag=direct status=progress`
##### Créer la clef via tee
- `tee < path/to/archlinux-version-x86_64.iso > /dev/sdX`
##### Créer la clef via pv
- `pv path/to/archlinux-version-x86_64.iso -Yo /dev/sdX`

# Installation automatique
Voire [README](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/Arch/Archterneum/README.md)
## Drivers
- GPU & CPU : AMD
## Images et vidéos
[Arch video background](https://www.youtube.com/watch?v=B40xhtICzBY)
### SSH x KeePass
#### SSH with KeePass locked
![Arch SSH](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/arch-keepass-ssh.png)
#### SSH auto login with KeePass unlocked
![Arch SSH unlocked](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/arch-keepass-ssh-unlock.png)
### Rofi
![Arch rofi](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/arch-rofi.png)
### Vencord
![Arch vencord](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/arch-vencord.png)
### Waybar
![Arch waybar](https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/assets/images/arch-waybar.png)
