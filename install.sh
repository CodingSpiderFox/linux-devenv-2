#!/bin/bash

sudo apt install -y snapd software-properties-gtk
sudo add-apt-repository ppa:unit193/encryption

sudo apt install -y firefox git keepassxc zsh gedit gdebi wget libgl1-mesa-glx libegl1-mesa libxcb-xtest0 snapd python3-pip curl openjdk-8-jdk openjdk-11-jdk screenfetch tmux cargo jq gnome-disk-utility
# for otpclient build
sudo apt install -y  cmake libgtk-3-dev libjansson-dev libgcrypt20-dev libzip-dev libpng-dev libzbar-dev

snap install intellij-idea-ultimate --classic
snap install bpytop postman

curl https://get.docker.com | sudo sh
sudo usermod -aG docker user

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

### Install otpclient

git clone https://github.com/CodingSpiderFox/libbaseencode
cd libbaseencode
mkdir build && cd $_
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
make
sudo make install
cd ../../

git clone https://github.com/CodingSpiderFox/libcotp
cd libcotp
mkdir build && cd $_
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../   # add -DBUILD_TESTING=ON if you want to compile also the tests
make
sudo make install
cd ../../

git clone https://github.com/CodingSpiderFox/OTPClient.git
cd OTPClient
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
sudo make install

### End install otpclient

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'


npm i -g newman
npm i -g nvm
npm i -g nx
npm i -g yarn

pip3 install docker-compose

sudo apt remove epiphany

