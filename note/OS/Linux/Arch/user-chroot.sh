# Change home
echo "User-chroot installation"
username=$(whoami)
echo "Old home : $HOME"
HOME=/home/$username
echo "new home is : $HOME"
userpassword="UserPass123"

# Yay installation
echo "Yay installation" && mkdir ~/git-clone && cd ~/git-clone && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -s --noconfirm
yaytar=$(find ~/git-clone/yay/ -name 'yay-*.pkg.tar.zst' | grep -v 'debug')
echo $userpassword | sudo -S pacman -U --noconfirm --needed $yaytar

# Install with yay
echo "Getting PipeWire" && yay -S --noconfirm --needed pipewire
echo "Getting SwayFx" && yay -S --noconfirm --needed swayfx
echo "Getting Brave" && yay -S --noconfirm --needed brave-bin
# yay -Rns protonup-qt # Peut être requis pour clean avant d'install
echo "Getting Proton UP QT" && yay -S --noconfirm --needed protonup-qt


## Enable PipeWire
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
## Show if PipeWire is running
echo "pactl info = " && pactl info

# Hyperland configuration
mkdir -p ~/.config/hypr && cp /usr/share/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.default
curl -o ~/.config/hypr/hyprland.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/hyprland.conf

# SDDM keyboard layout
localectl set-x11-keymap fr

# Clean install
echo "Clean installation"
echo $userpassword | sudo -S pacman -Scc --noconfirm
echo $userpassword | sudo -S yay -Scc --noconfirm

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
