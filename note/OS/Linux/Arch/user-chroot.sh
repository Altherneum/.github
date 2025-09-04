# Change home with variables from /arch.sh
echo "User-chroot installation"
username=$1
echo "Old home : $HOME"
HOME=/home/$username
echo "new home is : $HOME"
userpassword=$2

# Yay installation
echo "Yay installation" && mkdir ~/git-clone && cd ~/git-clone && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -s --noconfirm
yaytar=$(find ~/git-clone/yay/ -name 'yay-*.pkg.tar.zst' | grep -v 'debug')
echo $userpassword | sudo -S pacman -U --noconfirm --needed $yaytar

# Install with yay

echo "Getting PipeWire" && yay -S --noconfirm --needed pipewire
## Enable PipeWire
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
## Show if PipeWire is running
### echo "pactl info = " && pactl info # Need hyprland started # It generate error as nothing is running for now & we are inside chroot
echo "Getting Soundux" && yay -S --noconfirm --needed soundux

## Downloading software from yay
echo "Getting Brave" && yay -S --noconfirm --needed brave-bin
echo "Getting Proton UP QT" && yay -S --noconfirm --needed protonup-qt
echo "Getting Bottles" && yay -S --noconfirm --needed bottles
echo "Getting MPVPaper" && yay -S --noconfirm --needed mpvpaper
echo "Getting Pipes.sh" && yay -S --noconfirm --needed pipes.sh
echo "Getting Waydroid" && yay -S --noconfirm --needed waydroid


# SDDM configuration
echo $userpassword | sudo -S mkdir -p /etc/sddm.conf.d
echo $userpassword | sudo -S cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
echo $userpassword | sudo -S curl -o /etc/sddm.conf.d/sddm.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/sddm.conf

# Hyperland configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr 
echo $userpassword | sudo -S cp /usr/share/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hyprland.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/hyprland.conf

# Hyprlock configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr
echo $userpassword | sudo -S cp /usr/share/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hyprlock.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/hyprlock.conf
echo $userpassword | sudo -S curl -o ~/.config/hypr/background.mp4 https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/backgrounds/neon-galaxy-bedroom.1920x1080.mp4

# HyprIdle configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr
echo $userpassword | sudo -S cp /usr/share/hypr/hypridle.conf ~/.config/hypr/hypridle.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hypridle.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/hypridle.conf

# Waybar
echo $userpassword | sudo -S mkdir -p ~/.config/waybar
echo $userpassword | sudo -S cp /etc/xdg/waybar/config.jsonc ~/.config/waybar/config.jsonc.default
echo $userpassword | sudo -S curl -o ~/.config/waybar/config.jsonc https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/waybar.conf

# Keyboard layout
echo $userpassword | localectl set-x11-keymap fr
echo $userpassword | localectl set-keymap fr

# To set up a systemd splash screen on Arch Linux, you can use the unified kernel image (UKI) feature, which allows you to embed a splash image directly into the boot binary. This method does not require Plymouth and works with systemd-boot. The splash image, typically a BMP file, is specified in the /etc/mkinitcpio.d/linux.preset file using the default_options="--splash=/path/to/image.bmp" parameter.
# The image is then embedded into the UKI binary during the mkinitcpio build process.
# The default splash image is located at /usr/share/systemd/bootctl/splash-arch.bmp, and you can replace it or specify a custom one.

# Clean install
echo "Clean installation"
echo $userpassword | sudo -S pacman -Scc --noconfirm
echo $userpassword | sudo -S yay -Scc --noconfirm

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
