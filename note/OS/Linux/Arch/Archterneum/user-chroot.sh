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
### Waydroid
echo "Getting Waydroid" && yay -S --noconfirm --needed waydroid
#### Initialize Waydroid ROM
echo $userpassword | sudo -S waydroid init -s GAPPS

echo "Getting Emote" && yay -S --noconfirm --needed emote

# SDDM configuration
echo $userpassword | sudo -S mkdir -p /etc/sddm.conf.d
echo $userpassword | sudo -S cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
echo $userpassword | sudo -S curl -o /etc/sddm.conf.d/sddm.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/sddm.conf

# Hyperland configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr 
echo $userpassword | sudo -S cp /usr/share/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hyprland.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/hyprland.conf

# Hyprlock configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr
echo $userpassword | sudo -S cp /usr/share/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hyprlock.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/hyprlock.conf
echo $userpassword | sudo -S curl -o ~/.config/hypr/background.mp4 https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/backgrounds/neon-galaxy-bedroom.1920x1080.mp4

# HyprIdle configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr
echo $userpassword | sudo -S cp /usr/share/hypr/hypridle.conf ~/.config/hypr/hypridle.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hypridle.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/hypridle.conf

# Waybar
echo $userpassword | sudo -S mkdir -p ~/.config/waybar
echo $userpassword | sudo -S cp /etc/xdg/waybar/config.jsonc ~/.config/waybar/config.jsonc.default
echo $userpassword | sudo -S curl -o ~/.config/waybar/config.jsonc https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/waybar.conf
## Waybar CSS
echo $userpassword | sudo -S cp /etc/xdg/waybar/style.css ~/.config/waybar/style.css.default
echo $userpassword | sudo -S curl -o ~/.config/waybar/style.css https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/waybar.css
## Waybar pacman custom script
echo $userpassword | sudo -S curl -o ~/.config/waybar/pacman_updater.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/pacman_updater.sh
echo $userpassword | sudo -S chmod +x ~/.config/waybar/pacman_updater.sh
## waybar power_menu.xml
echo $userpassword | sudo -S curl -o ~/.config/waybar/power_menu.xml https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/power_menu.xml

# xfce4-notifyd
##### download theme file as : mkdir -p ~/.themes/transparent/xfce-notify-4.0/ ; cp /usr/share/themes/Smoke/xfce-notify-4.0/gtk.css ~/.themes/transparent/xfce-notify-4.0/gtk.css
mkdir -p ~/.themes/transparent/xfce-notify-4.0/
echo $userpassword | sudo -S curl -o ~/.themes/transparent/xfce-notify-4.0/gtk.css https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/notifyd.css
xfconf-query -c xfce4-notifyd -p /theme -s transparent
xfconf-query -c xfce4-notifyd -p /notify-location -s bottom-center
# xfce4-terminal
xfconf-query -c xfce4-terminal --create -p /color-foreground --type string -s ""
xfconf-query -c xfce4-terminal --create -p /color-use-theme --type bool -s "false"
xfconf-query -c xfce4-terminal --create -p /color-cursor-use-default --type bool -s "true"
xfconf-query -c xfce4-terminal --create -p /background-mode --type string -s "TERMINAL_BACKGROUND_TRANSPARENT"
xfconf-query -c xfce4-terminal --create -p /background-darkness --type double -s "0.5"
xfconf-query -c xfce4-terminal --create -p /run-custom-command --type bool -s "true"
xfconf-query -c xfce4-terminal --create -p /custom-command --type string -s "fastfetch"
xfconf-query -c xfce4-terminal --create -p /font-name --type string -s "Monospace 12"
xfconf-query -c xfce4-terminal --create -p /font-use-system --type bool -s "false"
xfconf-query -c xfce4-terminal --create -p /color-foreground --type string -s "#ffffff"
xfconf-query -c xfce4-terminal --create -p /color-background --type string -s "#000000000000"
xfconf-query -c xfce4-terminal --create -p /misc-cursor-shape --type string -s "TERMINAL_CURSOR_SHAPE_IBEAM"
## xfce4-terminal spacing
echo $userpassword | sudo -S touch ~/.config/gtk-3.0/gtk.css
echo $userpassword | sudo -S sh -c 'echo "VteTerminal, vte-terminal {" >> /home/'$username'/.config/gtk-3.0/gtk.css'
echo $userpassword | sudo -S sh -c 'echo "    padding: 25px;" >> /home/'$username'/.config/gtk-3.0/gtk.css'
echo $userpassword | sudo -S sh -c 'echo "}" >> /home/'$username'/.config/gtk-3.0/gtk.css'

# fastfetch on terminal open
echo "fastfetch" >> ./.bashrc

# Rofi theme
echo $userpassword | sudo -S mkdir -p ~/.local/share/rofi/themes/
echo $userpassword | sudo -S curl -o ~/.local/share/rofi/themes/theme.rasi https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/rofi.rasi
# Rofi cmd script
echo $userpassword | sudo -S mkdir -p ~/.config/rofi/
echo $userpassword | sudo -S curl -o ~/.config/rofi/run_cmd.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/rofi_run_cmd.sh
echo $userpassword | sudo -S chmod +x ~/.config/rofi/run_cmd.sh
# Rofi cliphist-rofi-img
echo $userpassword | sudo -S curl -o ~/.config/rofi/cliphist-rofi-img.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/cliphist-rofi-img
echo $userpassword | sudo -S chmod +x ~/.config/rofi/cliphist-rofi-img.sh
# Rofi start script
echo $userpassword | sudo -S curl -o ~/.config/rofi/start.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/start-rofi
echo $userpassword | sudo -S chmod +x ~/.config/rofi/start.sh

# XDG theme config
echo $userpassword | sudo -S mkdir -p ~/.config/xdg-desktop-portal/
echo $userpassword | sudo -S curl -o ~/.config/xdg-desktop-portal/hyprland-portals.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/hyprland-portals.conf

# Keyboard layout
echo $userpassword | localectl set-x11-keymap fr
echo $userpassword | localectl set-keymap fr

# Hyprbars
# Work in auto ??? test before leaving chroot
echo ""
echo "hypr plugins"
echo ""
# Or else do it auto on first launch, then delete script
echo $userpassword | sudo -S pacman --noconfirm --needed -S cpio
echo $userpassword | sudo -S echo "" ; hyprpm --force update
echo $userpassword | sudo -S echo "" ; hyprpm --force add https://github.com/hyprwm/hyprland-plugins
echo $userpassword | sudo -S echo "" ; hyprpm --force add https://github.com/virtcode/hypr-dynamic-cursors
echo $userpassword | sudo -S echo "" ; hyprpm --force enable hyprbars
echo $userpassword | sudo -S echo "" ; hyprpm --force enable dynamic-cursors
#
echo ""
echo "hypr plugins"
echo ""
#
## "Normal" setup but not working # To test later
# cd /home/arch/git-clone && rm -rf ./hyprland-plugins && git clone https://github.com/hyprwm/hyprland-plugins.git && cd hyprland-plugins/hyprbars
# meson setup . build
# sudo make installheaders
# meson compile -C build
# hyprctl plugin load $PWD/build/libhyprbars.so

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
