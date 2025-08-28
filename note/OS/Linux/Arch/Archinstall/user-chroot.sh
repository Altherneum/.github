# Change home
username=$(whoami)
echo "Old home : $HOME"
HOME=/home/$username
echo "new home is : $HOME"
userpassword="UserPass123"

# Yay installation
mkdir ~/git-clone && cd ~/git-clone && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -s --noconfirm
yaytar=$(find ~/git-clone/yay/ -name 'yay-*.pkg.tar.zst' | grep -v 'debug')
echo $userpassword | sudo -S pacman -U --noconfirm --needed $yaytar

# Install with yay
# echo $userpassword | sudo -S yay -S --noconfirm --needed swayfx brave-bin pipewire-{jack,jack-dropin,alsa,pulse}
echo "Getting pipewire" && echo $userpassword | sudo -S yay -S --noconfirm --needed pipewire
echo "Getting swayfx" && echo $userpassword | sudo -S yay -S --noconfirm --needed swayfx
echo "Getting Brave" && echo $userpassword | sudo -S yay -S --noconfirm --needed brave


## Enable PipeWire
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
## Show if PipeWire is running
pactl info

# Hyperland configuration
mkdir -p ~/.config/hypr && cp /usr/share/hyprland/examples/hyprland.conf ~/.config/hypr/

# Clean install
echo $userpassword | sudo -S pacman -Scc --noconfirm
echo $userpassword | sudo -S yay -Scc --noconfirm

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
