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
Pour installer l'ISO sur une clef USB : [rufus.ie](https://rufus.ie/fr/)
- [github.com/pbatard/rufus/releases/latest](https://github.com/pbatard/rufus/releases/)

# Configuration
- `loadkeys fr` Pour passer le clavier en FR

## Mise à jour
- `pacman -Syy` Pour mettre à jour les paquets pacman

## Disques
[wiki.archlinux.org /title /Fdisk #Create_a_partition_table_and_partitions](https://wiki.archlinux.org/title/Fdisk#Create_a_partition_table_and_partitions)
### FDisk
- `fdisk -l` ou `lsblk` pour lister les disques

[wiki.archlinux.org/title/Partitioning](https://wiki.archlinux.org/title/Partitioning), [wiki.archlinux.org /title /Installation_guide #Partition_the_disks](https://wiki.archlinux.org/title/Installation_guide#Partition_the_disks)

- `fdisk /dev/[DISK]` exemple : `fdisk /dev/sda`

#### Partition GPT
Si vous avez installé Windows, vous disposez déjà d'une table de partition GPT.
Sinon, créez une table de partition GPT vide à l'aide de la commande `g`
- Option `g` Pour créer une partition GPT
- Valider tout, cela effacera tout le disque

#### EFI
```
Command (m for help): n
Partition number: <Press Enter>
First sector: <Press Enter>
Last sector, +/-sectors or +/-size{K,M,G,T,P}: +100M

Command (m for help): t
Partition type or alias (type L to list all): uefi
```

#### Boot
```
Command (m for help): n
Partition number: <Press Enter>
First sector: <Press Enter>
Last sector, +/-sectors or +/-size{K,M,G,T,P}: +512M

Command (m for help): t
Partition number (2-128, default 2): <Press Enter>
Partition type or alias (type L to list all): linux
```

#### Swap
```
Command (m for help): n
Partition number: <Press Enter>
First sector: <Press Enter>
Last sector, +/-sectors or +/-size{K,M,G,T,P}: +2g

Command (m for help): t
Partition number (3-128, default 3): <Press Enter>
Partition type or alias (type L to list all): swap
```

#### LUKS
```
Command (m for help): n
Partition number: <Press Enter>
First sector: <Press Enter>
Last sector, +/-sectors or +/-size{K,M,G,T,P}: <Press Enter>

Command (m for help): t
Partition number (4-128, default 4): <Press Enter>
Partition type or alias (type L to list all): linux
```

Affichez la table de partition à l'aide de la commande `p` et vérifiez
```
Command (m for help): p
```

Écrivez les modifications sur le disque à l'aide de la commande `w`
```
Command (m for help): w
```
### Formater
- `mkfs.fat -F 32 /dev/sda1` (EFI)
- `mkfs.ext4 /dev/sda2` (Boot)
### Cryptlvm
- `cryptsetup --use-random luksFormat /dev/sda4` (LUKS)
- `YES`
- Tapper une passphrase : exemple `password`
- `cryptsetup luksOpen /dev/sda4 cryptlvm`
#### Créer le volume LVM physique
- `lvmdiskscan` Pour afficher les disques compatibles avec les volumes physiques
- `pvcreate /dev/[DISK]`, exemple : `pvcreate /dev/mapper/cryptlvm`
- `pvdisplay` Pour afficher les PV
#### Créer le volume groupe
- `vgcreate [NOM] [VOLUME]`, exemple : `vgcreate vg0 /dev/mapper/cryptlvm`
- `vgdisplay` Pour afficher les VG
#### Créer les volumes logiques
- `lvcreate --size 1G -n root vg0` /root
- `lvcreate --size 4G -n swap vg0` /swap
- `lvcreate -l 100%FREE -n home vg0` /home
- `lvreduce --size -256M vg0/home`
#### Formater les volumes logiques
- `mkfs.ext4 /dev/vg0/root`
- `mkfs.ext4 /dev/vg0/home`
### Mémoire swap
[wiki.archlinux.org /title /Installation_guide #Format_the_partitions](https://wiki.archlinux.org/title/Installation_guide#Format_the_partitions)
- `mkswap /dev/swap`
- `swapon /dev/vg0/swap`
### Point de montage
- `mount /dev/vg0/root /mnt`
- `mount --mkdir /dev/sda1 /mnt/efi`
- `mount --mkdir /dev/sda2 /mnt/boot`
- `mount --mkdir /dev/vg0/home /mnt/home`
### Vérifier le disque
Lancer `lsblk` pour vérifier la configuration

## Installer
- `pacstrap -K /mnt base linux linux-firmware openssh git sudo nano`
- `genfstab -U /mnt >> /mnt/etc/fstab` Génère le `fstab`
- `arch-chroot /` Permet de se lancer `chroot` dans le système

## Clavier
- `loadkeys fr` Pour passer en clavier FR pour la session
  - `localectl list-keymaps` Pour lister les layouts
- `echo "KEYMAP=fr" > /etc/vconsole.conf` Pour être permanent

## Font
[wiki.archlinux.org /title /Installation_guide #Set_the_console_keyboard_layout_and_font](https://wiki.archlinux.org/title/Installation_guide#Set_the_console_keyboard_layout_and_font)
- `setfont ter-132b` Changer de font
- `showconsolefont` Pour afficher la font
# To do
[which_fonts_do_you_guys_actually_install/](https://www.reddit.com/r/archlinux/comments/rm3kch/which_fonts_do_you_guys_actually_install/)
[/vconsole.conf perma font save](https://man.archlinux.org/man/vconsole.conf.5.en)

## TimeZone
- `timedatectl set-timezone Europe/Paris` Pour changer de timezone
- `timedatectl list-timezones` Pour lister les timezones

## Langue
- `echo "LANG=fr_FR.UTF-8" > /etc/locale.conf` Pour changer la langue

## Vérifier son réseau
- Ethernet : branchez le câble
- Wi-Fi : authentifiez-vous auprès du réseau sans fil à l'aide de `iwctl`

- `ip link` Pour vérifier vos interfaces réseau
- `ping archlinux.org`

## Hostname
- `nano /etc/hostname`

## mkinitcpio
Parce que notre système de fichiers est sur LVM, nous devrons activer les bons hooks mkinitcpio

Modifiez le fichier /etc/mkinitcpio.conf. Recherchez la variable HOOKS et mettez-la à jour pour qu'elle ressemble à :
```
HOOKS=(base udev autodetect keyboard keymap modconf block encrypt lvm2 filesystems fsck)
```

## initramfs
Regenerate the initramfs:

- Télécharger a bootloader: `pacman -S grub efibootmgr`
- `grub-install /dev/sda1` ou ancienne doc : `grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB`
- `grub-mkconfig -o /boot/grub/grub.cfg`

## Complete
Installer des packages supplémentaires pour la gestion des utilisateurs et du réseau : `sudo pacman -Syu sudo iw iwd dhcpcd`
## Mots de passe Root
- `passwd`

## Relancer
- exit `chroot`: `exit`
- unmount everything : `umount -R /mnt`
- and reboot : `reboot`

## Mise à jour du système
- `pacman -Syuu` Mise à jour des paquets
  - `-S, --sync`
  - `-y, --refresh`
  - `-u, --upgrades`

/home Swap /var ...
https://wiki.archlinux.org/title/Installation_guide#Select_the_mirrors
https://wiki.archlinux.org/title/Installation_guide#Root_password
https://wiki.archlinux.org/title/Installation_guide#Localization
https://wiki.archlinux.org/title/Linux_console#Keyboard_shortcuts
https://wiki.archlinux.org/title/KDE