# Change home
username=$(whoami)
echo "Old home : $HOME"
HOME=/home/$USER
echo "new home is : $HOME"

# Yay installation
mkdir ~/git-clone && cd ~/git-clone && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm

# swayfx
yay -S --noconfirm --needed swayfx 

# Brave browser
yay -S --noconfirm --needed brave-bin

# PipeWire audio
yay -S --noconfirm --needed pipewire-{jack,jack-dropin,alsa,pulse}
## Enable PipeWire
systemctl --user enable pipewire pipewire-pulse wireplumber
# systemctl --user start pipewire pipewire-pulse wireplumber # No need to start it will do it on reboot
## Show if PipeWire is running
pactl info

# Dev
yay -S --noconfirm --needed vscodium-bin github-desktop-bin

# Steam
yay -S --noconfirm --needed steam

# Hyperland configuration
mkdir -p ~/.config/hypr && cp /usr/share/hyprland/examples/hyprland.conf ~/.config/hypr/

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
