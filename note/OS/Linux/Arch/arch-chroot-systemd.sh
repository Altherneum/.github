arch-chroot /mnt /bin/bash << EOF

# Variables
hostname=desktop
username=admin
password=password
rootpassword=toor

# User config
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
echo "KEYMAP=fr" >> /etc/vconsole.conf
echo "FONT=ter-v28b" >> /etc/vconsole.conf
echo "LANG=fr_FR.UTF-8" >> /etc/locale.conf

# User
echo "$rootpassword" | passwd --stdin

useradd -m -s /bin/bash ${username}
echo "$password" | passwd $username --stdin

usermod -aG wheel ${username}
echo ${hostname} >> /etc/hostname

yes | pacman -S systemd os-prober efibootmgr dosfstools amd-ucode

# mkinitcpio
sed -i 's/HOOKS=(.*)/HOOKS=(base systemd autodetect keyboard sd-vconsole modconf block sd-encrypt lvm2 filesystems brtfs)/' /etc/mkinitcpio.conf
mkinitcpio -p linux-zen

bootctl --path=/boot install

# /boot/loader/loader.conf
echo "default arch.conf" > /boot/loader/loader.conf
echo "timeout 3" >> /boot/loader/loader.conf
echo "console-mode max" >> /boot/loader/loader.conf
echo "editor no" >> /boot/loader/loader.conf

# Set Disk ID to LVM
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)
# UUIDroot=$(blkid -o value -s UUID /dev/mapper/cryptlvm) # Use less now

# /boot/loader/entries/arch.conf
echo "title Arch Linux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options root=UUID=${UUIDcrypt} rw" >> /boot/loader/entries/arch.conf


EOF

umount -R /mnt
# reboot