#!/bin/bash
trap 'echo "Installation script failed"' ERR
set -e

read -p 'Hostname: ' HOSTNAME
read -p 'Username: ' USERNAME
read -p 'GPU (intel,nvidia,amd): ' GPU
read -s -p 'Password: ' PASSWORD

exit 1

set -x

# Check if root and boot mounted
lsblk -o MOUNTPOINTS | grep '^/mnt$'
lsblk -o MOUNTPOINTS | grep '^/mnt/boot$'
BOOT=$(lsblk -o MOUNTPOINTS | grep '^/mnt/boot$' | awk '{print $1}')

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt bash -c "
ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
hwclock --systohc

sed -i '/en_US.UTF-8/c\en_US.UTF-8 UTF-8' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo \"$HOSTNAME\" > /etc/hostname

# Grub
pacman -S grub efibootmgr os-prober --noconfirm
mount /dev/$BOOT /boot --mkdir
grub-install --target=x86_64 --efi-directory=/boot --bootloader-id=grub
sed -i '/GRUB_DISABLE_OS_PROBER/c\GRUB_DISABLE_OS_PROBER=false' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# Essentials
case $GPU in
  intel)
    pacman -S xf86-video-intel mesa
	;;
  nvidia)
    pacman -S nvidia nvidia-utils
	;;
  amd)
    pacman -S xf86-video-amdgpu mesa
	;;
esac

pacman -S --noconfirm\
xorg-server \
plasma \
sddm \
dhcpcd \
iw \
networkmanager \
dolphin \
zsh \
vi \
neovim \
konsole \
git \
gcc \
firefox \

systemctl enable sddm
systemctl enable NetworkManager

# Set root password
echo \"root:$PASSWORD\" | chpasswd

# Create user
useradd -m $USERNAME
echo \"$USERNAME:$PASSWORD\" | chpasswd
echo \"$USERNAME ALL=(ALL:ALL) ALL\" | EDITOR='tee -a' visudo
"

echo "Done!"