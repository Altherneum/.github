username=$(logname)

## Cleaning cache & config
sudo rm -R /home/$username/.config/discord/
sudo rm -R /home/$username/.config/Vencord/

## Downloading Vencord
echo "Downloading Vencord"
sudo curl -o /home/$username/vencord -L https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli-linux
sudo chmod +x /home/$username/vencord
su -c 'sudo env "$@" "SUDO_USER=$(whoami)" "/home/'$username'/vencord" --install -location /opt/discord' $username
sudo rm -f /home/$username/vencord

## ~/.config/Vencord/themes/
echo "Creating user ~/.config/Vencord/themes/"
sudo -u $username mkdir -p /home/$username/.config/Vencord/themes/
sudo curl -o /home/$username/.config/Vencord/themes/transparent.css https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/discord.css

## ~/.config/Vencord/settings/
echo "Creating user ~/.config/Vencord/settings/"
sudo -u $username mkdir -p /home/$username/.config/Vencord/settings/
sudo curl -o /home/$username/.config/Vencord/settings/settings.json https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/discord.json
