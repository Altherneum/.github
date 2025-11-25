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
echo "Getting Zen-browser" && yay -S --noconfirm --needed zen-browser-bin
echo "Getting Proton UP QT" && yay -S --noconfirm --needed protonup-qt
echo "Getting Bottles" && yay -S --noconfirm --needed bottles
echo "Getting MPVPaper" && yay -S --noconfirm --needed mpvpaper
echo "Getting Pipes.sh" && yay -S --noconfirm --needed pipes.sh

### Waydroid
# echo "Getting Waydroid" && yay -S --noconfirm --needed waydroid
#### Initialize Waydroid ROM
##### Docs : https://forum.garudalinux.org/t/ultimate-guide-to-install-waydroid-in-any-arch-based-distro-especially-garuda/15902 : https://medium.com/@tony.j.miri/android-on-linux-mint-with-waydroid-setup-guide-ff0ca8eab22
# echo $userpassword | sudo -S waydroid init -s GAPPS
#### Start Waydroid
# echo $userpassword | sudo -S systemctl enable --now waydroid-container
# echo $userpassword | sudo -S waydroid container start
# waydroid session start
#### Full screen
# waydroid prop set persist.waydroid.width 750
# waydroid prop set persist.waydroid.height 950
#### Start Waydroid
# waydroid session stop
# echo $userpassword | sudo -S waydroid container stop
##### https://docs.waydro.id/faq/google-play-certification

### MC
echo "Getting MC-Launcher" && yay -S --noconfirm --needed minecraft-launcher

### Emote launcher
echo "Getting Emote" && yay -S --noconfirm --needed emote

# SDDM configuration
echo $userpassword | sudo -S mkdir -p /etc/sddm.conf.d
echo $userpassword | sudo -S cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
echo $userpassword | sudo -S curl -o /etc/sddm.conf.d/sddm.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/sddm.conf
echo $userpassword | sudo -S sed -i 's/User=admin/User='$username'/' /etc/sddm.conf.d/sddm.conf

# Hyperland configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr 
echo $userpassword | sudo -S cp /usr/share/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hyprland.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/hyprland.conf

# Hyprlock configuration
echo $userpassword | sudo -S mkdir -p ~/.config/hypr
echo $userpassword | sudo -S cp /usr/share/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf.default
echo $userpassword | sudo -S curl -o ~/.config/hypr/hyprlock.conf https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/hyprlock.conf
## MpvPaper script
echo $userpassword | sudo -S curl -o ~/.config/hypr/mpvpaper.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/mpv.sh
echo $userpassword | sudo -S chmod +x ~/.config/hypr/mpvpaper.sh
## MpvPaper Video background list
echo $userpassword | sudo -S mkdir -p ~/.config/hypr/backgrounds/
# Get each video
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/1.mp4 https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/backgrounds/neon-galaxy-bedroom.1920x1080.mp4
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/2.mp4 -L https://motionbgs.com/dl/hd/6199
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/3.mp4 -L https://motionbgs.com/dl/hd/2623
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/4.mp4 -L https://motionbgs.com/dl/hd/8536
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/5.mp4 -L https://motionbgs.com/dl/hd/8325
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/6.mp4 -L https://motionbgs.com/dl/hd/4607
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/7.mp4 -L https://motionbgs.com/dl/hd/53
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/8.mp4 -L https://motionbgs.com/dl/hd/1044
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/9.mp4 -L https://motionbgs.com/dl/hd/3261
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/10.mp4 -L https://motionbgs.com/dl/hd/1363
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/11.mp4 -L https://motionbgs.com/dl/hd/2887
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/12.mp4 -L https://motionbgs.com/dl/hd/5093
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/13.mp4 -L https://motionbgs.com/dl/hd/1585
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/14.mp4 -L https://motionbgs.com/dl/hd/7003
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/15.mp4 -L https://motionbgs.com/dl/hd/2538
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/16.mp4 -L https://motionbgs.com/dl/hd/6870
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/17.mp4 -L https://motionbgs.com/dl/hd/4356
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/18.mp4 -L https://motionbgs.com/dl/hd/5681
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/19.mp4 -L https://motionbgs.com/dl/hd/8134
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/20.mp4 -L https://motionbgs.com/dl/hd/6643
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/21.mp4 -L https://motionbgs.com/dl/hd/5351
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/22.mp4 -L https://motionbgs.com/dl/hd/5529
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/23.mp4 -L https://motionbgs.com/dl/hd/3511
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/24.mp4 -L https://motionbgs.com/dl/hd/6598
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/25.mp4 -L https://motionbgs.com/dl/hd/2104
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/26.mp4 -L https://motionbgs.com/dl/hd/3123
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/27.mp4 -L https://motionbgs.com/dl/hd/2078
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/28.mp4 -L https://motionbgs.com/dl/hd/8778
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/29.mp4 -L https://motionbgs.com/dl/hd/8638
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/30.mp4 -L https://motionbgs.com/dl/hd/8445
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/31.mp4 -L https://motionbgs.com/dl/hd/5300
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/32.mp4 -L https://motionbgs.com/dl/hd/3277
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/33.mp4 -L https://motionbgs.com/dl/hd/8151
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/34.mp4 -L https://motionbgs.com/dl/hd/7644
echo $userpassword | sudo -S curl -o ~/.config/hypr/backgrounds/35.mp4 -L https://motionbgs.com/dl/hd/7028

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
##### download theme
mkdir -p ~/.themes/transparent/xfce-notify-4.0/
echo $userpassword | sudo -S curl -o ~/.themes/transparent/xfce-notify-4.0/gtk.css https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/notifyd.css
xfconf-query -c xfce4-notifyd --create -p /theme --type string -s "transparent"
xfconf-query -c xfce4-notifyd --create -p /notify-location --type string -s "bottom-center"
# xfce4-terminal
xfconf-query -c xfce4-terminal --create -p /color-foreground --type string -s ""
xfconf-query -c xfce4-terminal --create -p /color-use-theme --type bool -s "false"
xfconf-query -c xfce4-terminal --create -p /color-cursor-use-default --type bool -s "true"
xfconf-query -c xfce4-terminal --create -p /background-mode --type string -s "TERMINAL_BACKGROUND_TRANSPARENT"
xfconf-query -c xfce4-terminal --create -p /background-darkness --type double -s "0.5"
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

## pavucontrol theme
echo $userpassword | sudo -S cp -a /home/'$username'/.config/gtk-3.0/ /home/'$username'/.config/gtk-4.0/ 

# fastfetch
## fastfetch on terminal open
echo "fastfetch" >> ~/.bashrc
echo "PS1='\n\[\e[1m\]\[\e[0m\] \[\e[1;2;4m\]\D{%a %H %b %Y}\[\e[0m\]    \[\e[1m\]󰅐\[\e[0m\] \[\e[1m\]\t\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[2m\]\u\[\e[0m\]@\[\e[2m\]\H\[\e[0m\]    \[\e[1m\]\[\e[0m\] \[\e[1m\]\w\n\[\e[0m\] \[\e[1;2;4m\]History\[\e[0m\] \[\e[2m\]n°\[\e[1m\]\!\[\e[0m\] \[\e[1;2m\]=[\[\e[0;1;5m\]\$\[\e[25;2m\]]>\[\e[0m\] '" >> ~/.bashrc
## fastfetch configuration file
echo $userpassword | sudo -S mkdir -p ~/.config/fastfetch
echo $userpassword | sudo -S curl -o ~/.config/fastfetch/config.jsonc https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/fastfetch.jsonc

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
echo $userpassword | sudo -S echo "" ; yes | hyprpm --force add https://github.com/hyprwm/hyprland-plugins
echo $userpassword | sudo -S echo "" ; yes | hyprpm --force add https://github.com/virtcode/hypr-dynamic-cursors
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

# hyprpm hook
echo $userpassword | sudo -S curl -o  /usr/share/libalpm/hooks/pacman-hyprpm.hook https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/pacman-hyprpm.hook

# Discord -> Vencord hook
# echo $userpassword | sudo -S curl -o  /usr/share/libalpm/hooks/pacman-vencord.hook https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/pacman-vencord.hook
echo $userpassword | sudo -S curl -o  /usr/share/libalpm/scripts/vencord.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/vencord.sh
echo $userpassword | sudo -S chmod +x /usr/share/libalpm/scripts/vencord.sh
echo $userpassword | sudo -S /bin/bash /usr/share/libalpm/scripts/vencord.sh

# Slash screen
# To set up a systemd splash screen on Arch Linux, you can use the unified kernel image (UKI) feature, which allows you to embed a splash image directly into the boot binary. This method does not require Plymouth and works with systemd-boot. The splash image, typically a BMP file, is specified in the /etc/mkinitcpio.d/linux.preset file using the default_options="--splash=/path/to/image.bmp" parameter.
# The image is then embedded into the UKI binary during the mkinitcpio build process.
# The default splash image is located at /usr/share/systemd/bootctl/splash-arch.bmp, and you can replace it or specify a custom one.

# Clean install
echo "Clean installation"
echo $userpassword | sudo -S pacman -Scc --noconfirm
echo $userpassword | sudo -S yay -Scc --noconfirm

# Reset /home/user/ owner to the user
echo $userpassword | sudo -S chown -R $username:$username /home/$username

# Exit user arch-chroot
echo "Exit user arch-chroot"
exit
echo "exited"
