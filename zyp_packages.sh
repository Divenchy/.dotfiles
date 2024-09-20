#!/bin/bash

# Hopefully install most needed packages and some nice ones
sudo zypper install fzf make bat eza zoxide tmux thefuck git libX11-devel libXft-devel libXinerama-devel freetype2-devel fontconfig-devel gcc-c++ gcc zsh qemu picom postgresql16 ninja cmake gettext-tools curl libvert lazygit inkscape htop gtk4-devel gtk3-devel gtk2-devel gtk2-devel-32bit gtk3-devel-32bit gimp gh gdb flex bison fish feh fd docker chrony brightnessctl bridge-utils base grim slurp scrot ranger ffmpeg ImageMagick

# Setup git profile (fix later)
cp ~/.dotfiles/.gitconfig ~/.gitconfig

# Install suckless software
ln -s ~/.dotfiles/suckless ~/

cd ~/suckless/weoweoDWM/ && sudo make clean install
cd ~/suckless/st/ && sudo make clean install
cd ~/suckless/dmenu/ && sudo make clean install
cd ~/suckless/slstatus/ && sudo make clean install

ln -s ~/.dotfiles/suckless/dwm.desktop /usr/share/xsessions/

# Change shell to zsh and setup rc
ln -s ~/.dotfiles/zsh ~/.config/zsh
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
chsh -s /usr/bin/zsh

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -1

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

cd ~/


ln -s ~/.dotfiles/makeTemplates/ ~/makeTemplates


# Last setup xinit
ln -s ~/.dotfiles/.xinitrc ~/
