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

# Cryptlvm
echo $lvmpassword | cryptsetup --use-random luksFormat /dev/sda2
echo $lvmpassword | cryptsetup luksOpen /dev/sda2 cryptlvm

# Volume physique PV
pvcreate /dev/mapper/cryptlvm
# Volume de groupe VG
vgcreate vg0 /dev/mapper/cryptlvm
# Volume logique LV
lvcreate --size 1G -n root vg0 # /root
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
mkfs.ext4 /dev/sda1
mount --mkdir /dev/sda1 /mnt/boot

# Packages
yes | pacstrap /mnt base linux linux-firmware base-devel lvm2 cryptsetup grub efibootmgr networkmanager
# Removed for test download speed # yes | pacstrap openssh git sudo nano
# Genfstab config
genfstab -U /mnt >> /mnt/etc/fstab

# Jump into installation
arch-chroot /mnt /bin/bash <<"EOT"

curl -o /chroot.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/chroot.sh
chmod +x /chroot.sh
/chroot.sh

# exit # Removed for TEST
# umount -R /mnt # Removed for TEST
# reboot # Removed for TEST

EOT