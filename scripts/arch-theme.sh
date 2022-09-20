#!/bin/bash

# KDE Lightly
sudo pacman -S cmake extra-cmake-modules kdecoration qt5-declarative qt5-x11extras
mkdir -p /tmp && cd /tmp
git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git
cd Lightly && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
make
sudo make install