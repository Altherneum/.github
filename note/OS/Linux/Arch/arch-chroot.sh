# Variables
hostname=desktop | arch-chroot /mnt
username=admin | arch-chroot /mnt
password=password | arch-chroot /mnt
rootpassword=toor | arch-chroot /mnt

# User config
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime  | arch-chroot /mnt
echo "KEYMAP=fr" > /etc/vconsole.conf | arch-chroot /mnt
echo "LANG=fr_FR.UTF-8" > /etc/locale.conf | arch-chroot /mnt

# User
echo "$rootpassword" | passwd --stdin | arch-chroot /mnt

useradd -m -s /bin/bash ${username} | arch-chroot /mnt
echo "$password" | passwd $username --stdin | arch-chroot /mnt

usermod -aG wheel ${username} | arch-chroot /mnt
hostnamectl set-hostname ${hostname} | arch-chroot /mnt

# Setup grub (TO TEST) & OS Prober = dual boot
yes | pacman -S grub os-prober | arch-chroot /mnt
# yes | pacman -S os-prober # only os-prober to test systemd

# mkinitcpio
sed -i 's/HOOKS=(.*)/HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf | arch-chroot /mnt

# grub
grub-install --target=x86_64-efi --bootloader-id=ArchLinux --efi-directory=/boot/efi --removable /dev/sda | arch-chroot /mnt

# Set Disk ID to LVM
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2) | arch-chroot /mnt
UUIDroot=$(blkid -o value -s UUID /dev/mapper/cryptlvm) | arch-chroot /mnt
sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"\(.*\)\"/GRUB_CMDLINE_DEFAULT=\"loglevel=3 quiet cryptdevice=UUID=${UUIDcrypt}:cryptlvm root=UUID=${UUIDroot}\"/" /etc/default/grub | arch-chroot /mnt

# grub mkconfig
grub-mkconfig -o /boot/grub/grub.cfg | arch-chroot /mnt
mkinitcpio -P | arch-chroot /mnt