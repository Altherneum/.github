# Variables
hostname=desktop
username=admin
password=password
rootpassword=toor

# User config
echo "KEYMAP=fr" > /etc/vconsole.conf
echo "LANG=fr_FR.UTF-8" > /etc/locale.conf
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true

# User
echo "$rootpassword" | passwd --stdin

useradd -m -s /bin/bash ${username}
echo "$password" | passwd $username --stdin

# usermod -aG sudo ${username}
### Vérifier le fichier sudoers si le groupe sudo est OK pour utiliser l'élévation de privilèges
### Erreur report group sudo existe pas, dans la config %sudo est commenté
hostnamectl set-hostname ${hostname}

# mkinitcpio
sed -i 's/HOOKS=(.*)/HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf
mkinitcpio -P

grub-install --target=x86_64-efi --bootloader-id=ArchLinux --efi-directory=/boot --removable /dev/sda

UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)
UUIDroot=$(blkid -o value -s UUID /dev/mapper/cryptlvm)
sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"\(.*\)\"/GRUB_CMDLINE_DEFAULT=\"loglevel=3 quiet cryptdevice=UUID=${UUIDcrypt}:cryptlvm root=UUID=${UUIDroot}\"/" /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

# exit
# reboot