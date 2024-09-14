#!/bin/bash

# Hopefully install most needed packages and some nice ones
sudo zypper install fzf make bat eza zoxide tmux thefuck git libX11-devel libXft-devel libXinerama-devel freetype2-devel fontconfig-devel gcc-c++ gcc zsh qemu picom postgresql16 ninja cmake gettext-tools curl libvert lazygit inkscape htop gtk4-devel gtk3-devel gtk2-devel gtk2-devel-32bit gtk3-devel-32bit gimp gh gdb flex bison fish feh fd docker chrony brightnessctl bridge-utils base

# Install suckless software
cp -r ~/.dotfiles/suckless/ ~/

cd ~/suckless/weoweoDWM/ && sudo make clean install


# Change shell to zsh
chsh -s /usr/bin/zsh

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

source ~/.zshrc
source ~/.bashrc

nvm install 22

node -v

npm -v

# Install neovim

# Ensure in home directory
cd ~/

git clone https://github.com/neovim/neovim

cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 

sudo make install 
