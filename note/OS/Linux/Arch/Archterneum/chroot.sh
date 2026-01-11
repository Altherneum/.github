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
sleepcmd=$10

# Timezone and Clock
echo "TimeZone and clock"
eval "$sleepcmd"
ln -sf /usr/share/zoneinfo$localtime /etc/localtime
hwclock --systohc

# Console Settings
echo "Console Keymap & font"
eval "$sleepcmd"
echo "KEYMAP=$langkey" > /etc/vconsole.conf
echo "FONT=$fonttype" >> /etc/vconsole.conf

# Locale
echo "Locale"
eval "$sleepcmd"
echo "$utflang UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=$utflang" > /etc/locale.conf

# Computer & user
## Hostname
echo "Hostname"
eval "$sleepcmd"
echo "$hostname" > /etc/hostname

## Root Password
echo "Root Password"
eval "$sleepcmd"
echo "root:$rootpassword" | chpasswd

## Create User
echo "User Creation"
eval "$sleepcmd"
useradd -m -s /bin/bash "$username"
echo "$username:$userpassword" | chpasswd

## Add the user to sudoers file
echo "Adding to sudoers"
eval "$sleepcmd"
usermod -aG wheel "$username"
## Add the user to input group
usermod -aG input "$username"

## Uncomment wheel's group line
echo "Adding to wheels group"
eval "$sleepcmd"
sed -i 's/^[[:space:]]*# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Sudo less
echo "Adding to sudoless"
eval "$sleepcmd"
sudo touch /etc/sudoers.d/$username
sudo sh -c "echo '$username ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/$username"
# sudoers file already include files in this directory

# Pacman config
echo "Pacman configuration"
eval "$sleepcmd"
## Add colors
sed -i 's/^#Color/Color/' /etc/pacman.conf
## Add pacman Parallel Downloads
sed -i 's/^#\?ParallelDownloads.*/ParallelDownloads = 1/' /etc/pacman.conf
## Add multilib pacman (for steam)
sed -z 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' -i /etc/pacman.conf

# https://community.unix.com/t/18-mar-2012-1403-209-general-error-socket-file-descriptor-exceeds-limit-4096-4096/306717/2
# Waybar fix
## Update the per process limit for descriptors to avoid waybar crash
echo "Waybar fix"
eval "$sleepcmd"
set rlim_fd_max  8192
set rlim_fd_cur  8192

# Installing software
## Update keyring for PGP
echo "PGP keyring update"
eval "$sleepcmd"
pacman-key --init
pacman-key --populate archlinux
pacman -Sy archlinux-keyring --noconfirm
## Update system
echo "Pacman update -Syu"
eval "$sleepcmd"
pacman -Syu --noconfirm
## .config
echo "Creating user ~/.config"
eval "$sleepcmd"
sudo -u $username mkdir -p /home/$username/.config
## OS
echo "Downloading SoftWare"
eval "$sleepcmd"
pacman -S --needed --noconfirm hyprland sddm wayland hyprlock hypridle waybar bind networkmanager xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
### Rofi
echo "Rofi"
eval "$sleepcmd"
pacman -S --needed --noconfirm rofi rofi-calc
#### requiered for rofi plugin click close
pacman -S --needed --noconfirm slurp jq
mkdir -p /home/$username/.config/rofi
curl -o /home/$username/.config/rofi/rofi-slurp-monitor.sh -L https://raw.githubusercontent.com/ilivetruth/rofi-wayland-click-to-close/refs/heads/main/rofi-slurp-monitor.sh
chmod +x /home/$username/.config/rofi/rofi-slurp-monitor.sh
### Language stack
echo "Java & Go"
eval "$sleepcmd"
pacman -S --needed --noconfirm jdk21-openjdk go
### Enable SDDM
echo "Enabling SDDM"
eval "$sleepcmd"
systemctl enable sddm
### Sound system
echo "Downloading soundSystem"
eval "$sleepcmd"
pacman -S --needed --noconfirm pipewire wireplumber
pacman -S --needed --noconfirm cava # Sound visualizer
pacman -S --needed --noconfirm vlc
pacman -S --needed --noconfirm pavucontrol
## Media
### Screen shots
echo "Downloading ScreenShot software"
eval "$sleepcmd"
pacman -S --needed --noconfirm grim slurp
pacman -S --needed --noconfirm hyprshot
### Images
pacman -S --needed --noconfirm gimp
### clipboard
echo "Downloading ClipBoard SoftWare"
eval "$sleepcmd"
pacman -S --needed --noconfirm wl-clipboard cliphist
#### https://github.com/sentriz/cliphist?tab=readme-ov-file#picker-examples # cliphist to do list
### Other media
echo "Downloading OBS SoftWare"
eval "$sleepcmd"
pacman -S --needed --noconfirm obs-studio
### Discord
echo "Downloading Discord SoftWare"
eval "$sleepcmd"
pacman -S --needed --noconfirm discord
#### Vencord
# echo "Vencord Hook"
# eval "$sleepcmd"
# curl -o /home/$username/pacman-vencord.hook https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/pacman-vencord.hook
# chmod +x /home/$username/pacman-vencord.hook
# /home/$username/pacman-vencord.hook arch

## Steam
echo "Downloading Steam"
eval "$sleepcmd"
pacman -S --needed --noconfirm steam
sed -i 's/Notifications.PanelPosition     \"BottomRight\"/Notifications.PanelPosition     "TopRight"/' /home/$username/.steam/steam/resource/styles/steam.styles
## System
echo "Downloading Terminal, File Explorer and manual"
eval "$sleepcmd"
pacman -S --needed --noconfirm xfce4 nautilus man
echo "Downloading fonts"
eval "$sleepcmd"
pacman -S --needed --noconfirm otf-font-awesome noto-fonts-emoji
pacman -S --needed --noconfirm $(pacman -Sgq nerd-fonts)
fc-cache # reload cache of fonts
echo "Downloading Git & KeepassXC"
eval "$sleepcmd"
pacman -S --needed --noconfirm git ufw keepassxc
### Other software
echo "Downloading BTop/HTop & FastFetch"
eval "$sleepcmd"
pacman -S --needed --noconfirm btop fastfetch htop
## Video drivers
echo "Downloading Video Drivers"
eval "$sleepcmd"
### xf86
pacman -S --needed --noconfirm xf86-video-amdgpu
### Mesa
pacman -S --needed --noconfirm mesa lib32-mesa libva-mesa-driver lib32-libva-mesa-driver
### Vulkan
pacman -S --needed --noconfirm amdvlk lib32-amdvlk
pacman -S --needed --noconfirm vulkan-radeon lib32-vulkan-radeon
#### Display VGA & 3D env
echo "Displaying each VGA & 3D env"
eval "$sleepcmd"
lspci -k | grep -A 3 -E "(VGA|3D)"

# mkinitcpio
echo "MKInitCPIO"
eval "$sleepcmd"
# more /etc/mkinitcpio.conf
sed -i 's/^HOOKS=.*/HOOKS=(base udev keyboard autodetect microcode modconf kms keymap lvm2 consolefont block encrypt filesystems fsck)/' /etc/mkinitcpio.conf
sed -i 's/MODULES=.*/MODULES=(amdgpu radeon)/' /etc/mkinitcpio.conf # sudo sed -i 's/MODULES=($$.*$$)/MODULES=(amdgpu radeon \1)/' /etc/mkinitcpio.conf # if modules are not empty to append to it first it the row
# more /etc/mkinitcpio.conf
mkinitcpio -P

# systemd-boot installation
echo "BootCTL install"
eval "$sleepcmd"
bootctl install

# systemd-boot loader configuration
echo "BootLoader configuration"
eval "$sleepcmd"
echo "default arch" > /boot/loader/loader.conf
echo "timeout 5" >> /boot/loader/loader.conf
echo "console-mode max" >> /boot/loader/loader.conf
echo "LOADER" >> /boot/loader/loader.conf

# LVM and encrypted root UUID
echo "Setting LVM UUID"
eval "$sleepcmd"
UUIDcrypt=$(blkid -o value -s UUID "$device"p2)

# Boot entry
echo "BootLoader entry"
eval "$sleepcmd"
echo "title Arch Linux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /amd-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options cryptdevice=UUID=${UUIDcrypt}:lvm:allow-discards resume=/dev/vg0/swap root=/dev/vg0/root rw" >> /boot/loader/entries/arch.conf

# Show desktop script
echo "ShowDesktop script"
eval "$sleepcmd"
curl -o /home/$username/show_desktop.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/show_desktop.sh
chmod +x /home/$username/show_desktop.sh

# Fan control
echo "FanControl"
eval "$sleepcmd"
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
## Starting network
echo "Network Setup"
eval "$sleepcmd"
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable NetworkManager
systemctl enable sshd

## Setting /etc/hosts
echo "Settings /etc/hosts"
eval "$sleepcmd"
echo "127.0.0.1    localhost" > /etc/hosts
echo "::1          localhost" >> /etc/hosts
echo "127.0.1.1    $hostname.localdomain    $hostname" >> /etc/hosts

# Verify bootctl
echo "BootCTL list"
eval "$sleepcmd"
bootctl list

# Set PS1
echo "Setting PS1"
eval "$sleepcmd"
echo "PS1='\n\[\e[1m\]\[\e[0m\] \[\e[1;2;4m\]\D{%a %H %b %Y}\[\e[0m\]    \[\e[1m\]󰅐\[\e[0m\] \[\e[1m\]\t\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[2m\]\u\[\e[0m\]@\[\e[2m\]\H\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[1m\]\w\n\[\e[0m\] \[\e[1;2;4m\]History\[\e[0m\] \[\e[2m\]n°\[\e[1m\]\!\[\e[0m\] \[\e[1;2m\]=[\[\e[0;1;5m\]\$\[\e[25;2m\]]>\[\e[0m\] '" >> /root/.bashrc

# KeePassXC ssh-agent configuration
## Enable SSH-agent
systemctl --user enable --now ssh-agent.socket
## Create environement.d & add socket to $SSH_AUTH_SOCK
mkdir -p ~/.config/environment.d
echo 'SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket' > ~/.config/environment.d/ssh-agent.conf

# Exit chroot
echo "Leaving Chroot"
eval "$sleepcmd"
echo "Installation and basic configuration complete. exiting chroot"
exit

echo "exited chroot"