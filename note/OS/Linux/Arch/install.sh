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

# # Jump into installation
# arch-chroot /mnt /bin/bash <<"EOT"
# curl -o /install.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch.sh
# chmod +x /install.sh
# /install.sh
# EOT

# Jump into installation
arch-chroot /mnt /bin/bash -c "curl -o /install.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch.sh && chmod +x /install.sh && /install.sh"