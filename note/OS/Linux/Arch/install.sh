# Variables
lvmpassword=lvmpassword
device=/dev/sda

# Setup
loadkeys fr
pacman -Syy
# Update PGP keys
pacman-key --refresh-keys

# Disques
parted --script "${device}" -- mklabel gpt \
  mkpart ESP fat32 1Mib 257MiB \
  set 1 bios_grub on \
  mkpart primary ext4 257MiB 100%

# Format Boot
mkfs.fat -F32 /dev/sda1

# Cryptlvm
echo $lvmpassword | cryptsetup --use-random luksFormat /dev/sda2
echo $lvmpassword | cryptsetup luksOpen /dev/sda2 cryptlvm

# Volume physique PV
pvcreate /dev/mapper/cryptlvm
# Volume de groupe VG
vgcreate vg0 /dev/mapper/cryptlvm
# Volume logique LV
lvcreate --size 5G -n root vg0 # /root
lvcreate --size 1G -n swap vg0 # /swap
lvcreate -l 100%FREE -n home vg0 # /home
lvreduce --size -256M vg0/home # garde de l'espace vide

# Format crypted mounted partition
mkfs.ext4 /dev/vg0/root
mkfs.ext4 /dev/vg0/home

# Format swap memory and mount it
mkswap /dev/vg0/swap
swapon /dev/vg0/swap

# Mount root & home
mount /dev/vg0/root /mnt
mount --mkdir /dev/vg0/home /mnt/home

# Boot
# mkfs.ext4 /dev/sda1 # Already formated :( it will erase ????
mount --mkdir /dev/sda1 /mnt/boot

read -p "Press [Enter] key to start pacstrap..."
# Packages
yes | pacstrap /mnt base linux linux-firmware sof-firmware grub base-devel lvm2 cryptsetup efibootmgr networkmanager sudo nano
# Removed for test download speed # yes | pacstrap openssh git sudo nano
# Genfstab config
genfstab -U /mnt >> /mnt/etc/fstab

read -p "Press [Enter] key to start arch-chroot..."
# Jump into installation
arch-chroot /mnt /bin/bash <<'EOT'

# Variables
hostname=desktop
username=admin
password=password
rootpassword=toor

# User config
read -p "Press [Enter] key to start Europe Paris local time..."
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
read -p "Press [Enter] key to start hwclock..."
hwclock --systohc
read -p "Press [Enter] key to start Keymap..."
echo "KEYMAP=fr" > /etc/vconsole.conf
read -p "Press [Enter] key to start lang..."
echo "LANG=fr_FR.UTF-8" > /etc/locale.conf

read -p "Press [Enter] key to start password & user ..."
# User
echo "$rootpassword" | passwd --stdin

useradd -m -s /bin/bash ${username}
echo "$password" | passwd $username --stdin

usermod -aG wheel ${username}
hostnamectl set-hostname ${hostname}

read -p "Press [Enter] key to start download grub..."
# Setup grub (TO TEST) & OS Prober = dual boot
yes | pacman -S grub os-prober

# mkinitcpio
sed -i 's/HOOKS=(.*)/HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf

read -p "Press [Enter] key to start install..."
# grub
grub-install --target=x86_64-efi --bootloader-id=ArchLinux --efi-directory=/boot --removable /dev/sda

read -p "Press [Enter] key to start setDisk..."
# Set Disk ID to LVM
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)
UUIDroot=$(blkid -o value -s UUID /dev/mapper/cryptlvm)
sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"\(.*\)\"/GRUB_CMDLINE_DEFAULT=\"loglevel=3 quiet cryptdevice=UUID=${UUIDcrypt}:cryptlvm root=UUID=${UUIDroot}\"/" /etc/default/grub

read -p "Press [Enter] key to start grub mkconfig..."
# grub mkconfig
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P

read -p "Press [Enter] key to finish..."
EOT



# umount -R /mnt # Removed for TEST
# reboot # Removed for TEST
# enable network
# systemctl enable NetworkManager
# systemctl enable powertop
# timedatectl set-ntp true 


# curl -o /chroot.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/chroot.sh
# chmod +x /chroot.sh
# /chroot.sh