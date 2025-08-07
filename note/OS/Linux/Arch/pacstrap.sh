# Packages
# yes | pacstrap /mnt base linux linux-firmware sof-firmware grub base-devel lvm2 cryptsetup efibootmgr networkmanager sudo nano # Grub
yes | pacstrap -i -noconfirm /mnt base linux linux-firmware linux-zen lvm2 cryptsetup sudo man-db base-devel linux-tools nano # Systemd bootloader

# Genfstab config
genfstab -U /mnt >> /mnt/etc/fstab
# echo "fmask=0137,dmask=0027" >> /mnt/etc/fstab # Check if it solve "Boot is world readable" # Or try 0077,0777 if not working

# Download chroot script
# curl -o /arch-chroot-grub.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch-chroot-grub.sh
# chmod +x /arch-chroot-grub.sh
# /arch-chroot-grub.sh

# Download chroot script ²
# curl -o /arch-chroot-systemd.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch-chroot-systemd.sh
# chmod +x /arch-chroot-systemd.sh
# /arch-chroot-systemd.sh

curl -o /mnt/arch-chroot-systemd.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/arch-chroot-systemd.sh
chmod +x /mnt/arch-chroot-systemd.sh
arch-chroot /mnt /arch-chroot-systemd.sh
