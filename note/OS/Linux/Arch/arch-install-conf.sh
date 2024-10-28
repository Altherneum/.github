# Execute with :
# curl -o /script.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch-install-conf.sh

hostname=desktop
username=admin
password=password
lvmpassword=lvmpassword
device=/dev/sda

loadkeys fr
pacman -Syy
timedatectl set-ntp true

# Disques
parted --script "${device}" -- mklabel gpt \
  mkpart ESP fat32 1Mib 129MiB \
  set 1 boot on \
  mkpart primary ext4 129MiB 100%

# Formater
mkfs.fat -F32 /dev/sda1

# Cryptlvm
cryptsetup --use-random luksFormat /dev/sda2 <<< ${passwordlvm}
cryptsetup luksOpen /dev/sda2 cryptlvm
#
pvcreate /dev/mapper/cryptlvm
vgcreate vg0 /dev/mapper/cryptlvm

# LV
lvcreate --size 1G -n root vg0
lvcreate --size 4G -n swap vg0
lvcreate -l 100%FREE -n home vg0
lvreduce --size -256M vg0/home

# Formater
mkswap /dev/vg0/swap
mkfs.ext4 /dev/vg0/root
mkfs.ext4 /dev/vg0/home
# Mount
mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
mount --mkdir /dev/vg0/home /mnt/home
swapon /dev/vg0/swap

yes | pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab


yes | pacstrap -K /mnt base linux linux-firmware openssh git sudo nano

genfstab -U /mnt >> /mnt/etc/fstab

# Jump into installation
arch-chroot /mnt /bin/bash


# # User
# useradd -m -s /bin/bash ${username}
# passwd ${username} <<< ${password}
# usermod -aG sudo ${username}
# hostnamectl set-hostname ${hostname}

# # mkinitcpio
# sed -i 's/HOOKS=(.*)/HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf
# mkinitcpio -P

# # Grub
# pacman -S --noconfirm --needed grub efibootmgr 
# sed -i 's/GRUB_CMDLINE_LINUX="\(.*\)"GRUB_CMDLINE_LINUX="cryptdevice=/dev/<your-disk-luks>:cryptlvm root=/dev/vg0/root"/' /etc/default/grub
# #grub-install --target=x86_64-efi --efi-directory=/boot/efi --removable --recheck
# #grub-install --target=x86_64-efi --bootloader-id=Arch --efi-directory=/boot/efi
# grub-mkconfig -o /boot/grub/grub.cfg


# # User config
# echo "KEYMAP=fr" > /etc/vconsole.conf
# echo "LANG=fr_FR.UTF-8" > /etc/locale.conf
# timedatectl set-timezone Europe/Paris