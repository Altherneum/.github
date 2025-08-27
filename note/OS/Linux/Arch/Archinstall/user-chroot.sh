# Change home
username=$(whoami)
echo "Old home : $HOME"
HOME=/home/$username
echo "new home is : $HOME"

# Yay installation
mkdir ~/git-clone && cd ~/git-clone && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm

# swayfx
userpassword="UserPass123"
echo $userpassword | sudo -S yay -S --noconfirm --needed swayfx brave-bin pipewire-{jack,jack-dropin,alsa,pulse} vscodium-bin github-desktop-bin steam

## Enable PipeWire
systemctl --user enable pipewire pipewire-pulse wireplumber
# systemctl --user start pipewire pipewire-pulse wireplumber # No need to start it will do it on reboot
## Show if PipeWire is running
pactl info

# Hyperland configuration
mkdir -p ~/.config/hypr && cp /usr/share/hyprland/examples/hyprland.conf ~/.config/hypr/

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
