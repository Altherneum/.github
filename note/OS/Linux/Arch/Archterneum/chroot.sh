# Variables from /arch.sh
localtime=$1
langkey=$2
fonttype=$3
utflang=$4
hostname=$5
rootpassword=$6
username=$7
userpassword=$8

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
echo "$username:$userpassword" | chpasswd

## Add the user to sudoers file
usermod -aG wheel "$username"

## Uncomment wheel's group line
sed -i 's/^[[:space:]]*# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Pacman config
## Add colors
sed -i 's/^#Color/Color/' /etc/pacman.conf
## Add pacman Parallel Downloads
sed -i 's/^#\?ParallelDownloads.*/ParallelDownloads = 1/' /etc/pacman.conf
## Add multilib pacman (for steam)
sed -z 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' -i /etc/pacman.conf

# Installing softwares
pacman -Syu --noconfirm
## OS
pacman -S --needed --noconfirm hyprland sddm wayland hyprlock hypridle waybar rofi networkmanager xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
### Enable SDDM
systemctl enable sddm
### Sound system
pacman -S --needed --noconfirm pipewire wireplumber cava
## Media
pacman -S --needed --noconfirm obs-studio discord
## Steam
pacman -S --needed --noconfirm steam
## System
pacman -S --needed --noconfirm xfce4 nautilus man
pacman -S --needed --noconfirm otf-font-awesome noto-fonts-emoji
pacman -S --needed --noconfirm $(pacman -Sgq nerd-fonts)
fc-cache # reload cache of fonts
pacman -S --needed --noconfirm git ufw keepassxc go
### Other software
pacman -S --needed --noconfirm btop fastfetch htop
## Video drivers
### xf86
pacman -S --needed --noconfirm xf86-video-amdgpu
### Mesa
pacman -S --needed --noconfirm mesa lib32-mesa libva-mesa-driver lib32-libva-mesa-driver
### Vulkan
pacman -S --needed --noconfirm amdvlk lib32-amdvlk
pacman -S --needed --noconfirm vulkan-radeon lib32-vulkan-radeon
#### Display VGA & 3D env
lspci -k | grep -A 3 -E "(VGA|3D)"

# mkinitcpio
# more /etc/mkinitcpio.conf
sed -i 's/^HOOKS=.*/HOOKS=(base udev keyboard autodetect microcode modconf kms keymap lvm2 consolefont block encrypt filesystems fsck)/' /etc/mkinitcpio.conf
sed -i 's/MODULES=.*/MODULES=(amdgpu radeon)/' /etc/mkinitcpio.conf # sudo sed -i 's/MODULES=($$.*$$)/MODULES=(amdgpu radeon \1)/' /etc/mkinitcpio.conf # if modules are not empty to append to it first it the row
# more /etc/mkinitcpio.conf
mkinitcpio -P

# systemd-boot installation
bootctl install

# systemd-boot loader configuration
echo "default arch" > /boot/loader/loader.conf
echo "timeout 5" >> /boot/loader/loader.conf
echo "console-mode max" >> /boot/loader/loader.conf
echo "LOADER" >> /boot/loader/loader.conf

# LVM and encrypted root UUID
UUIDcrypt=$(blkid -o value -s UUID /dev/sda2)

# Boot entry
echo "title Arch Linux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /amd-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options cryptdevice=UUID=${UUIDcrypt}:lvm:allow-discards resume=/dev/vg0/swap root=/dev/vg0/root rw" >> /boot/loader/entries/arch.conf

# Network setup
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable NetworkManager
systemctl enable sshd

echo "127.0.0.1    localhost" > /etc/hosts
echo "::1          localhost" >> /etc/hosts
echo "127.0.1.1    $hostname.localdomain    $hostname" >> /etc/hosts

# Verify bootctl
echo "BootCTL list"
bootctl list

# Exit chroot
echo "Installation and basic configuration complete. exiting chroot"
exit

echo "exited chroot"
