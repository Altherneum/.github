# Arch auto installation script

## install.sh
### Keyboard
`loadkeys fr` to load French keyboard "AZERTY"
### Downloading and running script
```
curl -o /install.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/install.sh
chmod +x /install.sh
/install.sh
```
### Set password
`nano`, `vim`, etc..., to update password
- [/install.sh](/note/OS/Linux/Arch/install.sh) (LVM & Disk to use)
- [/pacstrap.sh](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/Arch/pacstrap.sh)
- Chroot (Root, user, and hostname)
  - ~[arch-chroot-grub.sh](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/Arch/arch-chroot-grub.sh)~
  - [/mnt/arch-chroot-systemd.sh](https://github.com/Altherneum/.github/blob/main/note/OS/Linux/Arch/arch-chroot-systemd.sh)

## Start Arch
### Remove ISO
Retirer l'ISO ou CD/DVD du lecteur
### Boot the system
PRENDRE CAPTURE DU BOOT LOADER
