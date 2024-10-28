# Variables
lvmpassword=lvmpassword
device=/dev/sda

# Setup
loadkeys fr
pacman -Syy

# Disques
parted --script "${device}" -- mklabel gpt \
  mkpart ESP fat32 1Mib 257MiB \
  set 1 boot on \
  mkpart primary ext4 257MiB 100%

# Formater la partition /boot
mkfs.fat -F32 /dev/sda1

# Cryptlvm
echo $lvmpassword | cryptsetup --use-random luksFormat /dev/sda2
echo $lvmpassword | cryptsetup luksOpen /dev/sda2 cryptlvm

# Formater la partition chiffré
mkfs.ext4 /dev/mapper/cryptlvm

# Mount
mount /dev/mapper/cryptlvm /mnt
mount --mkdir /dev/sda1 /mnt/boot
# TEST
# mount /dev/sdaN /mnt
mount --rbind /dev  /mnt/dev
mount --rbind /proc /mnt/proc
mount --rbind /sys  /mnt/sys
# TEST

# Packages
yes | pacstrap /mnt base linux linux-firmware base-devel lvm2 cryptsetup grub efibootmgr networkmanager
# Removed for test download speed # yes | pacstrap openssh git sudo nano
# Genfstab config
genfstab -U /mnt >> /mnt/etc/fstab

# Jump into installation
arch-chroot /mnt /bin/bash <<"EOT"
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
EOT