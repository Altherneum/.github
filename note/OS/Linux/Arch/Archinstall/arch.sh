# Variables
device="/dev/sda"
lvmpassword="arch"

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
mount --mkdir /dev/sda1 /mnt/boot

# Install the base system
pacstrap -K /mnt linux linux-firmwar base base-devel vim nano terminus-font efibootmgr lvm2 cryptsetup networkmanager openssh os-prober dosfstools amd-ucode

# Get the fstab
genfstab -U /mnt > /mnt/etc/fstab

# Get the next stage
##curl -o https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch-chroot-systemd.sh
##chmod +x arch-chroot-systemd.sh && cp arch-chroot-systemd.sh /mnt

# Chroot
arch-chroot /mnt /bin/bash <<EOF

# Variables
localtime=/Europe/Paris
langkey=fr
fonttype=ter-v28b
utflang=fr_FR.UTF-8
hostname="ARCH"
rootpassword="arch"
username="arch"
userpassword="arch"

# Pacman config
## Add colors
sed -i 's/^#Color/Color/' /etc/pacman.conf
## Add pacman Parallel Downloads
sed -i 's/^#\?ParallelDownloads.*/ParallelDownloads = 1/' /etc/pacman.conf

# Timezone and Clock
ln -sf /usr/share/zoneinfo$localtime /etc/localtime
hwclock --systohc

# Console Settings
echo "KEYMAP=$langkey" > /etc/vconsole.conf
echo "FONT=$fonttype" >> /etc/vconsole.conf

# Locale
echo "$utflang UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=$utflang" > /etc/locale.conf

# Computer & user
## Hostname
echo "$hostname" > /etc/hostname

## Root Password
echo "root:$rootpassword" | chpasswd

## Create User
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd

## Add the user to sudoers file
usermod -aG wheel "$username"

## Uncomment wheel's group line
sed -i 's/^[[:space:]]*# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# mkinitcpio
sed -i 's/^HOOKS=.*/HOOKS=(base udev keyboard autodetect microcode modconf kms keymap encrypt lvm2 consolefont block encrypt filesystems fsck)/' /etc/mkinitcpio.conf
mkinitcpio -P

# systemd-boot installation
bootctl install

# systemd-boot loader configuration
cat > /boot/loader/loader.conf <<EOF
default arch
timeout 5
console-mode max
EOF

# LVM and encrypted root UUID
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)

# Boot entry
cat > /boot/loader/entries/arch.conf <<EOF
title Arch Linux
linux /vmlinuz-linux
initrd /amd-ucode.img
initrd /initramfs-linux.img
options cryptdevice=UUID=${UUIDcrypt}:lvm:allow-discards resume=/dev/vg0/swap root=/dev/vg0/root rw
EOF

# Network setup
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable NetworkManager
systemctl enable sshd

cat > /etc/hosts <<EOF
127.0.0.1    localhost
::1          localhost
127.0.1.1    $hostname.localdomain    $hostname
EOF

# Verify bootctl
bootctl list
echo "Installation and basic configuration complete. exiting chroot"
EOF
echo "Remove the CD/USB ISO of arch"
echo "Reboot into your new installation of Arch"
