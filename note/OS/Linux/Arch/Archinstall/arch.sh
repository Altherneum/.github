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