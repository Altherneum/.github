# Variables
lvmpassword="arch"
rootpassword="arch"
username="arch"
userpassword="arch"
hostname="ARCH"
device="/dev/sda"
localtime=/Europe/Paris
langkey=fr
fonttype=ter-v28b
utflang=fr_FR.UTF-8

# Timezone and Clock
ln -sf /usr/share/zoneinfo$Timezone /etc/localtime
hwclock --systohc

# Console Settings
echo "KEYMAP=$langkey" > /etc/vconsole.conf
echo "FONT=$fonttype" >> /etc/vconsole.conf

# Locale
echo "$utflang UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=$utflang" > /etc/locale.conf

# Computer & user
## Hostname
echo "$hostname" > /etc/hostname

## Root Password
echo "root:$rootpassword" | chpasswd

## Create User
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd

## Add the user to sudoers file
usermod -aG wheel "$username"

## Uncomment wheel's group line
### S/^[[:space:]]* 
#### L'expression régulière s/^[[:space:]]* est utilisée pour supprimer les espaces blancs (espaces, tabulations, retours à la ligne, etc.) au début d'une chaîne de caractères.
#### Elle est couramment utilisée dans des outils comme sed pour nettoyer les chaînes de texte en supprimant les espaces ou caractères blancs en début de ligne. Le motif ^[[:space:]]* correspond à un ou plusieurs caractères blancs situés au début de la chaîne, où ^ indique le début de la ligne et [[:space:]]* correspond à zéro ou plusieurs caractères blancs. Cette expression est particulièrement utile pour traiter des fichiers texte où les lignes peuvent avoir des indentations inutiles.
sed -i 's/^[[:space:]]*# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers