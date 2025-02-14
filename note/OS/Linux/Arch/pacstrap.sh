# Packages
yes | pacstrap /mnt base linux linux-firmware sof-firmware grub base-devel lvm2 cryptsetup efibootmgr networkmanager sudo nano
# Removed for test download speed # yes | pacstrap openssh git sudo nano
# Genfstab config
genfstab -U /mnt >> /mnt/etc/fstab

# Download chroot script
curl -o /arch-chroot-grub.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch-chroot-grub.sh
chmod +x /arch-chroot-grub.sh
# /arch-chroot-grub.sh

# Download chroot script ²
curl -o /arch-chroot-systemd.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch-chroot-systemd.sh
chmod +x /arch-chroot-systemd.sh
/arch-chroot-systemd.sh