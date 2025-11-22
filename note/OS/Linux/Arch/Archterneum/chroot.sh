# Variables from /arch.sh
localtime=$1
langkey=$2
fonttype=$3
utflang=$4
hostname=$5
rootpassword=$6
username=$7
userpassword=$8
device=$9

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
## Add the user to input group
usermod -aG input "$username"

## Uncomment wheel's group line
sed -i 's/^[[:space:]]*# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Sudo less
sudo touch /etc/sudoers.d/$username
sudo echo "$username ALL=(ALL) NOPASSWD: ALL" > sudo /etc/sudoers.d/$username
# sudoers file already include files in this directory

# Pacman config
## Add colors
sed -i 's/^#Color/Color/' /etc/pacman.conf
## Add pacman Parallel Downloads
sed -i 's/^#\?ParallelDownloads.*/ParallelDownloads = 1/' /etc/pacman.conf
## Add multilib pacman (for steam)
sed -z 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' -i /etc/pacman.conf

# https://community.unix.com/t/18-mar-2012-1403-209-general-error-socket-file-descriptor-exceeds-limit-4096-4096/306717/2
# Update the per process limit for descriptors to avoid waybar crash
set rlim_fd_max  8192
set rlim_fd_cur  8192

# Installing softwares
pacman -Syu --noconfirm
## OS
pacman -S --needed --noconfirm hyprland sddm wayland hyprlock hypridle waybar  networkmanager xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
### Rofi
pacman -S --needed --noconfirm rofi rofi-calc
#### requiered for rofi plugin click close
pacman -S --needed --noconfirm slurp jq
mkdir -p /home/$username/.config/rofi
curl -o /home/$username/.config/rofi/rofi-slurp-monitor.sh -L https://raw.githubusercontent.com/ilivetruth/rofi-wayland-click-to-close/refs/heads/main/rofi-slurp-monitor.sh
chmod +x /home/$username/.config/rofi/rofi-slurp-monitor.sh
### Language stack
pacman -S --needed --noconfirm  jdk21-openjdk go
### Enable SDDM
systemctl enable sddm
### Sound system
pacman -S --needed --noconfirm pipewire wireplumber
pacman -S --needed --noconfirm cava # Sound visualizer
pacman -S --needed --noconfirm vlc
pacman -S --needed --noconfirm pavucontrol
## Media
### Screen shots
pacman -S --needed --noconfirm grim slurp
pacman -S --needed --noconfirm hyprshot
### Images
pacman -S --needed --noconfirm gimp
### clipboard
pacman -S --needed --noconfirm wl-clipboard cliphist
#### https://github.com/sentriz/cliphist?tab=readme-ov-file#picker-examples # cliphist to do list
### Other media
pacman -S --needed --noconfirm obs-studio
### Discord & Vencord
curl -o /home/$username/pacman-vencord.hook https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/pacman-vencord.hook
chmod +x /home/$username/pacman-vencord.hook
/home/$username/pacman-vencord.hook arch

## Steam
pacman -S --needed --noconfirm steam
sed -i 's/Notifications.PanelPosition     \"BottomRight\"/Notifications.PanelPosition     "TopRight"/' /home/$username/.steam/steam/resource/styles/steam.styles
## System
pacman -S --needed --noconfirm xfce4 nautilus man
pacman -S --needed --noconfirm otf-font-awesome noto-fonts-emoji
pacman -S --needed --noconfirm $(pacman -Sgq nerd-fonts)
fc-cache # reload cache of fonts
pacman -S --needed --noconfirm git ufw keepassxc
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
UUIDcrypt=$(blkid -o value -s UUID "$device"p2)

# Boot entry
echo "title Arch Linux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /amd-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options cryptdevice=UUID=${UUIDcrypt}:lvm:allow-discards resume=/dev/vg0/swap root=/dev/vg0/root rw" >> /boot/loader/entries/arch.conf

# Show desktop script
curl -o /home/$username/show_desktop.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/show_desktop.sh
chmod +x /home/$username/show_desktop.sh

# Fan control
## Script
curl -o /home/$username/gpu_scan.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/get_hwmon_data.sh
sudo chmod +x /home/$username/gpu_scan.sh
## parsing data
touch /etc/fancontrol
echo "INTERVAL=10" >> /etc/fancontrol
gpuid=$(/home/$username/gpu_scan GPU device)
hwmon=$(/home/$username/gpu_scan GPU hwmon)
echo "DEVPATH=$hwmon=$gpuid" >> /etc/fancontrol
gpuid=$(/home/$username/gpu_scan GPU device)
echo "DEVNAME=$hwmon=amdgpu" >> /etc/fancontrol
echo "FCTEMPS=$hwmon/pwm1=$hwmon/temp1_input" >> /etc/fancontrol
echo "FCFANS= $hwmon/pwm1=" >> /etc/fancontrol
echo "MINTEMP=$hwmon/pwm1=20" >> /etc/fancontrol
echo "MAXTEMP=$hwmon/pwm1=75" >> /etc/fancontrol
echo "MINSTART=$hwmon/pwm1=0" >> /etc/fancontrol
echo "MINSTOP=$hwmon/pwm1=0" >> /etc/fancontrol
echo "MAXPWM=$hwmon/pwm1=255" >> /etc/fancontrol
systemctl enable fancontrol

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

# Set PS1
echo "PS1='\n\[\e[1m\]\[\e[0m\] \[\e[1;2;4m\]\D{%a %H %b %Y}\[\e[0m\]    \[\e[1m\]󰅐\[\e[0m\] \[\e[1m\]\t\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[2m\]\u\[\e[0m\]@\[\e[2m\]\H\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[1m\]\w\n\[\e[0m\] \[\e[1;2;4m\]History\[\e[0m\] \[\e[2m\]n°\[\e[1m\]\!\[\e[0m\] \[\e[1;2m\]=[\[\e[0;1;5m\]\$\[\e[25;2m\]]>\[\e[0m\] '" >> /root/.bashrc

# Exit chroot
echo "Installation and basic configuration complete. exiting chroot"
exit

echo "exited chroot"
