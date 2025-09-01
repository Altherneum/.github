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
## Enable PipeWire
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
## Show if PipeWire is running
### echo "pactl info = " && pactl info # Need hyprland started # It generate error as nothing is running for now & we are inside chroot

echo "Getting SwayFx" && yay -S --noconfirm --needed swayfx

echo "Getting Brave" && yay -S --noconfirm --needed brave-bin

echo "Getting Proton UP QT" && yay -S --noconfirm --needed protonup-qt

echo "Getting mpvpaper" && yay -S --noconfirm --needed mpvpaper

mkdir -p /etc/sddm.conf.d && cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
curl -o /etc/sddm.conf.d/sddm.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/sddm.conf

# Hyperland configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr && cp /usr/share/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.default
curl -o ~/.config/hypr/hyprland.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/hyprland.conf
# Hyprlock configuration
mkdir -p ~/.config/hypr && cp /usr/share/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf.default
curl -o ~/.config/hypr/hyprlock.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/hyprlock.conf
curl -o ~/.config/hypr/background.mp4 https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/files/backgrounds/neon-galaxy-bedroom.1920x1080.mp4

# Keyboard layout
echo $userpassword | localectl set-x11-keymap fr
echo $userpassword | localectl set-keymap fr

# https://github.com/GhostNaN/mpvpaper/blob/master/mpvpaper.man
#    # mpvpaper -l overlay -vs -o "no-audio loop" '*' ~/Wallpapers/Video/itachi-uchiha.1920x1080.mp4 -f ; sleep 1 ; hyprlock -c bg.conf ; pkill mpvpaper
#
#    # https://mpv.io/manual/master/#command-interface
#    #    # --video-unscaled=no --vf=scale=1920:1080:force_original_aspect_ratio=increase,crop=1920:1080
#
# https://www.reddit.com/r/hyprland/comments/1lc5ct5/comment/my0lwf6/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
#
# CMD will be inside Exec-once of Hyprland conf

# Clean install
echo "Clean installation"
echo $userpassword | sudo -S pacman -Scc --noconfirm
echo $userpassword | sudo -S yay -Scc --noconfirm

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
