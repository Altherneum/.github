# Variables
device="/dev/sda"
hostname="Arch"
username="User"
lvmpassword="BootPass123"
userpassword="UserPass123"
rootpassword="SuperPass123"
localtime="/Europe/Paris"
utflang="fr_FR.UTF-8"
langkey="fr"
fonttype="ter-v28b"

# Pacman config
## Add colors
sed -i 's/^#Color/Color/' /etc/pacman.conf
## Add pacman Parallel Downloads
sed -i 's/^#\?ParallelDownloads.*/ParallelDownloads = 1/' /etc/pacman.conf

# Update
pacman -Sy --noconfirm

# Disques
parted --script "$device" -- mklabel gpt \
  mkpart ESP fat32 1Mib 1024MiB \
  set 1 esp on \
  mkpart primary 1024MiB 100%

# Format Boot
mkfs.fat -F32 "$device"p1

# Cryptlvm
echo $lvmpassword | cryptsetup --use-random luksFormat "$device"p2
echo $lvmpassword | cryptsetup luksOpen "$device"p2 cryptlvm

# Volume physique PV
pvcreate /dev/mapper/cryptlvm
# Volume de groupe VG
vgcreate vg0 /dev/mapper/cryptlvm
# Volume logique LV
lvcreate --size 100G -n root vg0 # /root
lvcreate --size 32G -n swap vg0 # /swap
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
mount --mkdir "$device"p1 /mnt/boot

# Install the base system
pacstrap -K /mnt linux linux-firmware base base-devel nano terminus-font efibootmgr lvm2 cryptsetup networkmanager openssh os-prober dosfstools amd-ucode

# Get the fstab
genfstab -U /mnt > /mnt/etc/fstab

# Chroot
curl -o /mnt/chroot.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/chroot.sh
chmod +x /mnt/chroot.sh
arch-chroot /mnt /chroot.sh $localtime $langkey $fonttype $utflang $hostname $rootpassword $username $userpassword $device


# User-Chroot
echo "Run User chroot for software installation"
# User software installation
curl -o /mnt/user-chroot.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/user-chroot.sh
chmod +x /mnt/user-chroot.sh
arch-chroot -u $username /mnt /user-chroot.sh $username $userpassword
echo "exited user-chroot"

echo "Remove the CD/USB ISO of arch"
echo "Reboot into your new installation of Arch"
