username=$1

pacman -S --needed --noconfirm discord
curl -o /home/$username/vencord -L https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli-linux
chmod +x /home/$username/vencord
sudo pkexec env "$@" "SUDO_USER=$(whoami)" "/home/$username/vencord" --install -location /opt/discord
rm -f /home/$username/vencord
curl -o /home/$username/.config/Vencord/themes/transparent.css https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/discord.css
curl -o /home/$username/.config/Vencord/settings/settings.json https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/Archterneum/files/discord.json
