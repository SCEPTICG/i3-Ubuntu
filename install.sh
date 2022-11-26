#!/bin/bash

#INSTALAMOS I3-GAPS
#Instalamos las dependencias
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev \
libxkbcommon-x11-dev autoconf xutils-dev libtool automake nodejs npm meson asciidoc \
libxcb-shape0-dev libxcb-xrm-dev -y

wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.11.tar.gz
tar -xvzf libiconv-1.11.tar.gz
cd libiconv-1.11
./configure --prefix=/usr/local/libiconv
make
sudo make install
cd ..
rm -rf libiconv-1.11.tar.gz
rm -rf libiconv-1.11 

#Instalamos i3-gaps
mkdir build
cd build
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
meson -Ddocs=true -Dmans=true ../build
meson compile -C ../build
sudo meson install -C ../build

#INSTALAMOS LOS PAQUETES
sudo apt install neofetch kitty dunst -y

#CARGAMOS LA CONFIGURACIÓN DE NEOFETCH
cp config/neofetch ~/.config/neofetch

#CARGAMOS LA CONFIGURACIÓN DE KITTY
cp config/kitty ~/.config/kitty

#CARGAMOS LA CONFIGURACIÓN DE DUNST
cp config/dunst ~/.config/dunst