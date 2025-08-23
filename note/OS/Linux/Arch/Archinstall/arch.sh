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

# Timezone and Clock
ln -sf /usr/share/zoneinfo$Timezone /etc/localtime
hwclock --systohc

# Console Settings
echo "KEYMAP=$langkey" > /etc/vconsole.conf
echo "FONT=$fonttype" >> /etc/vconsole.conf

