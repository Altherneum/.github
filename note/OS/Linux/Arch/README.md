# Arch auto installation script

## install.sh
### Keyboard
`loadkeys fr` to load French keyboard "AZERTY"
### Downloading script
```
curl -o /install.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/install.sh
chmod +x /install.sh
```
### Set password
`nano`, `vim`, etc..., to update password
- [/install.sh](/note/OS/Linux/Arch/install.sh) (LVM & Disk to use)
- [/pacstrap.sh](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/Arch/pacstrap.sh)
- Chroot (Root, user, and hostname)
  - ~~[arch-chroot-grub.sh](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/Arch/arch-chroot-grub.sh)~~
  - [/mnt/arch-chroot-systemd.sh](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/Arch/arch-chroot-systemd.sh)
- [ # /user-space.sh](#installer-luserspace)
### Starting script
`/install.sh`

## Start Arch
### Remove ISO
Retirer l'ISO ou CD/DVD du lecteur (Virtuel comme physique)
### Boot the system
PRENDRE CAPTURE DU BOOT LOADER
## Installer l'userspace
- [/user-space.sh](/note/OS/Linux/Arch/user-space.sh)
  - Le fichier n'est pas téléchargé par défaut !
