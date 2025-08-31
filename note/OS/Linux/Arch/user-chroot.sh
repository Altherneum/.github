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
# echo "Getting pipewire" && echo $userpassword | sudo -S yay -S --noconfirm --needed pipewire # Seem not to work as it will prompt that it hate sudo :(
# echo "Getting swayfx" && echo $userpassword | sudo -S yay -S --noconfirm --needed swayfx # Seem not to work as it will prompt that it hate sudo :(
# echo "Getting Brave" && echo $userpassword | sudo -S yay -S --noconfirm --needed brave # Seem not to work as it will prompt that it hate sudo :(
echo "Getting pipewire" && yay -S --noconfirm --needed pipewire
echo "Getting swayfx" && yay -S --noconfirm --needed swayfx
echo "Getting Brave" && yay -S --noconfirm --needed brave-bin


## Enable PipeWire
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
## Show if PipeWire is running
echo "pactl info = " && pactl info

# Hyperland configuration
mkdir -p ~/.config/hypr && cp /usr/share/hypr/hyprland.conf ~/.config/hypr/

# Clean install
echo "Clean installation"
echo $userpassword | sudo -S pacman -Scc --noconfirm
echo $userpassword | sudo -S yay -Scc --noconfirm

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
