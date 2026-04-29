# Refresh arch keyring & keys
sudo pacman -Syy ; sudo pacman -S archlinux-keyring --noconfirm ; sudo pacman --refresh-keys || sudo pacman-key --refresh-keys

# Update all pacman's repo
sudo pacman -Syuu

# Update all yay's repo
yay -Syuu

# Update hyprpm's plugins
hyprpm update

# Update waybar
killall -SIGUSR2 waybar

# Send message that terminal close in 15s
echo 
echo 🛠️⚙️ 🔚
echo
echo 🕒️💤 15s ➡️ 🗑️ 

# Sleep 15s
sleep 15