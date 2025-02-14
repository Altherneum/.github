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
  mkpart ESP fat32 1Mib 1024MiB \
  set 1 esp on \
  mkpart primary ext4 1024MiB 100%

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


curl -o /pacstrap.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/pacstrap.sh
chmod +x /pacstrap.sh
# /pacstrap.sh

# umount -R /mnt # Removed for TEST
# reboot # Removed for TEST

# enable network
# systemctl enable NetworkManager
# systemctl enable powertop
# timedatectl set-ntp 

# bootctl install
# systemctl enable systemd-timesyncd # To replace Grub-install and related update