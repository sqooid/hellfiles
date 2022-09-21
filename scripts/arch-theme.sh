#!/bin/bash
mkdir -p /tmp

# KDE Lightly
sudo pacman -S cmake extra-cmake-modules kdecoration qt5-declarative qt5-x11extras
cd /tmp
git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git
cd Lightly && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
make
sudo make install

# KDE Catppuccin
cd /tmp
git clone https://github.com/catppuccin/KDE && cd KDE/kde-store-archives/global-theme
kpackagetool5 -i catppuccin.tar.gz
lookandfeeltool -a Catppuccin

# GRUB Catppuccin
cd /tmp
git clone https://github.com/catppuccin/grub.git && cd grub
sudo cp -r src/catppuccin-macchiato-grub-theme /usr/share/grub/themes/
sudo sed -i '/GRUB_THEME/c\GRUB_THEME="/usr/share/grub/themes/catppuccin-macchiato-grub-theme/theme.txt"' /etc/default/grub
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Konsole Catppuccin
cd /tmp
git clone https://github.com/catppuccin/konsole.git && cd konsole
cp Catppuccin-Macchiato.colorscheme ~/.local/share/konsole/
