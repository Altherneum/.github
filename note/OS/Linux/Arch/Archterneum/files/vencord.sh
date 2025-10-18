username=$1

sudo pacman -S --needed --noconfirm discord
sudo curl -o /home/$username/vencord -L https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli-linux
sudo chmod +x /home/$username/vencord
sudo pkexec env "$@" "SUDO_USER=$(whoami)" "/home/$username/vencord" --install -location /opt/discord
sudo rm -f /home/$username/vencord
sudo curl -o /home/$username/.config/Vencord/themes/transparent.css https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/discord.css
sudo curl -o /home/$username/.config/Vencord/settings/settings.json https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/discord.json
