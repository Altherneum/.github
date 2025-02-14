# Variables
hostname=desktop
username=admin
password=password
rootpassword=toor

# User config
read -p "Press [Enter] key to start Europe Paris local time..."
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
read -p "Press [Enter] key to start hwclock..."
# hwclock --systohc
read -p "Press [Enter] key to start Keymap..."
echo "KEYMAP=fr" > /etc/vconsole.conf
read -p "Press [Enter] key to start lang..."
echo "LANG=fr_FR.UTF-8" > /etc/locale.conf

read -p "Press [Enter] key to start password & user ..."
# User
echo "$rootpassword" | passwd --stdin

useradd -m -s /bin/bash ${username}
echo "$password" | passwd $username --stdin

usermod -aG wheel ${username}
hostnamectl set-hostname ${hostname}

read -p "Press [Enter] key to start download grub..."
# Setup grub (TO TEST) & OS Prober = dual boot
yes | pacman -S grub os-prober
# yes | pacman -S os-prober # only os-prober to test systemd

# mkinitcpio
sed -i 's/HOOKS=(.*)/HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)/' /etc/mkinitcpio.conf

read -p "Press [Enter] key to start install..."
# grub
grub-install --target=x86_64-efi --bootloader-id=ArchLinux --efi-directory=/boot/efi --removable /dev/sda

read -p "Press [Enter] key to start setDisk..."
# Set Disk ID to LVM
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)
UUIDroot=$(blkid -o value -s UUID /dev/mapper/cryptlvm)
sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"\(.*\)\"/GRUB_CMDLINE_DEFAULT=\"loglevel=3 quiet cryptdevice=UUID=${UUIDcrypt}:cryptlvm root=UUID=${UUIDroot}\"/" /etc/default/grub

read -p "Press [Enter] key to start grub mkconfig..."
# grub mkconfig
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P

read -p "Press [Enter] key to finish..."
exit