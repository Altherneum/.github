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

yes | pacman -S systemd os-prober efibootmgr dosfstools

# mkinitcpio
sed -i 's/HOOKS=(.*)/HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf

bootctl --path=/boot install

# /boot/loader/loader.conf
echo "default arch" > /boot/loader/loader.conf
echo "timeout 3" >> /boot/loader/loader.conf
echo "editor 0" >> /boot/loader/loader.conf

# Set Disk ID to LVM
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)
# UUIDroot=$(blkid -o value -s UUID /dev/mapper/cryptlvm) # Use less now

# /boot/loader/entries/arch.conf
echo "title Arch Linux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options cryptdevice=UUID=${UUIDcrypt}:cryptlvm root=/dev/volume/root quiet rw" >> /boot/loader/entries/arch.conf
echo "timeout 3" >> /boot/loader/entries/arch.conf
echo "editor 0" >> /boot/loader/entries/arch.conf

mkinitcpio -p linux

EOF

umount -R /mnt
# reboot