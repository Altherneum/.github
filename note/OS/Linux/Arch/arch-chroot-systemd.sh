arch-chroot /mnt /bin/bash << EOF

# Variables
hostname=desktop
username=admin
password=password
rootpassword=toor

# User config
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
# hwclock --systohc
echo "KEYMAP=fr" > /etc/vconsole.conf
echo "LANG=fr_FR.UTF-8" > /etc/locale.conf

# User
echo "$rootpassword" | passwd --stdin

useradd -m -s /bin/bash ${username}
echo "$password" | passwd $username --stdin

usermod -aG wheel ${username}
hostnamectl set-hostname ${hostname}

yes | pacman -S systemd os-prober

# mkinitcpio
sed -i 's/HOOKS=(.*)/HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf
mkinitcpio -p linux

bootctl install

mkdir /boot/loader
/boot/loader/loader.conf <<EOF
default arch
timeout 3
editor 0
EOF

# Set Disk ID to LVM
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)
UUIDroot=$(blkid -o value -s UUID /dev/mapper/cryptlvm)

mkdir /boot/loader/entries/
/boot/loader/entries/arch.conf <<EOF
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options cryptdevice=UUID=${UUIDcrypt}:cryptlvm root=/dev/volume/root quiet rw
timeout 3
editor 0
EOF

exit

EOF

umount -R /mnt