# Host name
hostname=$(dialog --stdout --inputbox "Enter hostname" 0 0) || exit 1
clear
: ${hostname:?"hostname cannot be empty"}

# User account
user=$(dialog --stdout --inputbox "Enter admin username" 0 0) || exit 1
clear
: ${user:?"user cannot be empty"}

# Root password
password=$(dialog --stdout --passwordbox "Enter admin password" 0 0) || exit 1
clear
: ${password:?"password cannot be empty"}
password2=$(dialog --stdout --passwordbox "Enter admin password again" 0 0) || exit 1
clear
[[ "$password" == "$password2" ]] || ( echo "Passwords did not match"; exit 1; )

# LVM password
passwordlvm=$(dialog --stdout --passwordbox "Enter LVM password" 0 0) || exit 1
clear
: ${passwordlvm:?"password cannot be empty"}
passwordlvm2=$(dialog --stdout --passwordbox "Enter LVM password again" 0 0) || exit 1
clear
[[ "$passwordlvm" == "$passwordlvm2" ]] || ( echo "Passwords did not match"; exit 1; )

# device
devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
device=$(dialog --stdout --menu "Select installtion disk" 0 0 0 ${devicelist}) || exit 1
clear

timedatectl set-ntp true

# Disques
parted --script "${device}" -- mklabel gpt \
  mkpart ESP fat32 1Mib 129MiB \
  set 1 boot on \
  mkpart primary linux-swap 129MiB 2153Mib \
  mkpart primary ext4 2153Mib 100%

part_boot="$(ls ${device}* | grep -E "^${device}p?1$")"
part_swap="$(ls ${device}* | grep -E "^${device}p?2$")"
part_root="$(ls ${device}* | grep -E "^${device}p?3$")"

# Formater
mkfs.fat -F32 "${part_boot}"
mkswap "${part_swap}"
mkfs.ext4 "${part_root}"

# Cryptlvm
cryptsetup --use-random luksFormat ${part_root} <<< ${passwordlvm}
cryptsetup luksOpen ${part_root} cryptlvm
#
pvcreate /dev/mapper/cryptlvm
vgcreate vg0 /dev/mapper/cryptlvm

## LV CREATE VOL ##
# `lvcreate --size 1G -n root vg0` /root
# `lvcreate --size 4G -n swap vg0` /swap
# `lvcreate -l 100%FREE -n home vg0` /home
# `lvreduce --size -256M vg0/home`

# Mount
swapon "${part_swap}"
mount "${part_root}" /mnt
mkdir /mnt/boot
mount "${part_boot}" /mnt/boot
# 

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

## CONFIG USER ##

pacman -S --noconfirm --needed grub efibootmgr networkmanager 

grub-install --target=x86_64-efi --efi-directory=/boot/efi --removable --recheck

grub-install --target=x86_64-efi --bootloader-id=Arch --efi-directory=/boot/efi

grub-mkconfig -o /boot/grub/grub.cfg