# Variables
device="/dev/sda"
lvmpassword="BootPass123"

# Pacman config
## Add colors
sed -i 's/^#Color/Color/' /etc/pacman.conf
## Add pacman Parallel Downloads
sed -i 's/^#\?ParallelDownloads.*/ParallelDownloads = 1/' /etc/pacman.conf

# Update
pacman -Sy --noconfirm

# Disques
parted --script "${device}" -- mklabel gpt \
  mkpart ESP fat32 1Mib 1024MiB \
  set 1 esp on \
  mkpart primary 1024MiB 100%

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
lvcreate -l 75%FREE -n root vg0 # /root
lvcreate --size 4G -n swap vg0 # /swap
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
mount --mkdir /dev/sda1 /mnt/boot

# Install the base system
pacstrap -K /mnt linux linux-firmware base base-devel nano terminus-font efibootmgr lvm2 cryptsetup networkmanager openssh os-prober dosfstools amd-ucode

# Get the fstab
genfstab -U /mnt > /mnt/etc/fstab

# Chroot
#arch-chroot /mnt /bin/bash <<EOF
## OLD Methode to chroot code all in one
#EOF
curl -o /mnt/chroot.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/chroot.sh
chmod +x /mnt/chroot.sh
arch-chroot /mnt /chroot.sh


echo "Run User chroot for software installation"
username="arch"
# User software installation
curl -o /mnt/user-chroot.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/user-chroot.sh
chmod +x /mnt/user-chroot.sh
arch-chroot -u $username /mnt /user-chroot.sh
echo "exited user-chroot"

echo "Remove the CD/USB ISO of arch"
echo "Reboot into your new installation of Arch"
