#!/bin/bash

# Query user for various set-up options
read -p "`echo $'What os is this on?\nEnter 1, 2, or 3:\n 1)openSUSE\n 2)WSL-openSUSE\n 3)MacOS\nINPUT: '`" os

if [[ $os == "openSUSE" ]] || [[ $os == "1" ]]; then                 ## Linux openSUSE case
    # Hopefully install most needed packages and some nice ones
    sudo zypper install fzf make bat eza zoxide tmux thefuck git libX11-devel libXft-devel libXinerama-devel freetype2-devel fontconfig-devel gcc-c++ gcc zsh qemu picom postgresql16 ninja cmake gettext-tools curl libvert lazygit inkscape htop gtk4-devel gtk3-devel gtk2-devel gtk2-devel-32bit gtk3-devel-32bit gimp gh gdb flex bison fish feh fd docker chrony brightnessctl bridge-utils base grim slurp scrot ranger ffmpeg ImageMagick wezterm


    # Install suckless software
    ln -s ~/.dotfiles/suckless ~/

    cd ~/suckless/weoweoDWM/ && sudo make clean install
    cd ~/suckless/st/ && sudo make clean install
    cd ~/suckless/dmenu/ && sudo make clean install
    cd ~/suckless/slstatus/ && sudo make clean install

    ln -s ~/.dotfiles/dwm.desktop /usr/share/xsessions/

    ln -s ~/.dotfiles/.wezterm.lua_linux_os ~/.wezterm.lua

    # Last setup xinit
    ln -s ~/.dotfiles/.xinitrc ~/

    ###### END OF linux-openSUSE setup #########

    # Setup git profile (fix later)
    cp ~/.dotfiles/.gitconfig ~/.gitconfig


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

    ######### Install weovim ##########

    # Ensure in home directory
    cd ~/

    git clone https://github.com/neovim/neovim

    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 

    sudo make install 

    cd ~/

    #####-- Apply weoVIM config to neovim --#####

    ## First ensure submodules are up to date
    cd ~/.dotfiles/
    git submodule update --init --recursive
    cd ~/.dotfiles/weoVIM/
    git fetch
    ## Make sure using main branch
    git checkout main
    git pull origin main
    ## Back to home
    cd ~/
    ln -s ~/.dotfiles/weoVIM ~/.config/nvim
    ######### ---END of weovim install--- ##########


    ##### Personal stuffs #######
    ln -s ~/.dotfiles/.scripts ~/.scripts
    ln -s ~/.dotfiles/buildTemplates ~/

    ##### ---- END of PERSONAL ---- ########
elif [[ $os == "WSL-openSUSE" ]] || [[ $os == "2" ]]; then               ## WSL case
    # Hopefully install most needed packages and some nice ones
    sudo zypper install fzf make bat eza zoxide tmux thefuck git libX11-devel libXft-devel libXinerama-devel freetype2-devel fontconfig-devel gcc-c++ gcc zsh qemu picom postgresql16 ninja cmake gettext-tools curl libvert lazygit inkscape htop gtk4-devel gtk3-devel gtk2-devel gtk2-devel-32bit gtk3-devel-32bit gimp gh gdb flex bison fish feh fd docker chrony brightnessctl bridge-utils base grim slurp scrot ranger ffmpeg ImageMagick wezterm

    # Setup git profile (fix later)
    cp ~/.dotfiles/.gitconfig ~/.gitconfig


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

    ######### Install weovim ##########

    # Ensure in home directory
    cd ~/

    git clone https://github.com/neovim/neovim

    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 

    sudo make install 

    cd ~/

    #####-- Apply weoVIM config to neovim --#####

    ## First ensure submodules are up to date
    cd ~/.dotfiles/
    git submodule update --init --recursive
    cd ~/.dotfiles/weoVIM/
    git fetch
    ## Make sure using main branch
    git checkout main
    git pull origin main
    ## Back to home
    cd ~/

    ln -s ~/.dotfiles/weoVIM ~/.config/nvim
    ######### ---END of weovim install--- ##########


    ##### Personal stuffs #######
    ln -s ~/.dotfiles/.scripts ~/.scripts
    ln -s ~/.dotfiles/buildTemplate ~/

elif [[ $os == "MacOS" ]] || [[ $os == "3" ]]; then                     ### MacOS case

    ## Prompt install for git or check for git
    git --version

    ###### Homebrew installation n packages ########
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    #### Install brew packages #######
    brew install awk fontconfig freetype grep jq lazygit bison bat cmake coreutils curl eza fd flex fzf gdb gettext gh gnu-tar gnutls gum make llvm ncurses ninja node pkg-config ripgrep rust starship thefuck tmux tree-sitter wget xorgproto zx z3 zoxide zsh
    ##-- Casks 
    brew install --cask wezterm alacritty font-hack-nerd-font librewolf raycast font-sf-mono-nerd-fon
    ######## End of Homebrew setup ###############

    ######### Install weovim ##########

    # Ensure in home directory
    cd ~/

    git clone https://github.com/neovim/neovim

    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 

    sudo make install 

    cd ~/

    #####-- Apply weoVIM config to neovim --#####

    ## First ensure submodules are up to date
    cd ~/.dotfiles/
    git submodule update --init --recursive
    cd ~/.dotfiles/weoVIM/
    git fetch
    ## Make sure using main branch
    git checkout main
    git pull origin main
    ## Back to home
    cd ~/

    ln -s ~/.dotfiles/weoVIM ~/.config/nvim

    ######### ---END of weovim install--- ##########

    ##### ZSH ZSH ZSH ZSH ZSH #####
    echo "Might need to change path of zsh plugins"
    ln -s ~/.dotfiles/zsh ~/.config/zsh
    ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
    chsh -s /usr/bin/zsh
    ##### ZSH ZSH ZSH ZSH ZSH #####


    #### Apply wezterm macOS flavored config ####
    ln -s ~/.dotfiles/.wezterm.lua_mac_os ~/.wezterm.lua

    ##### Personal stuffs #######
    ln -s ~/.dotfiles/.scripts ~/.scripts
    ln -s ~/.dotfiles/buildTemplates ~/
fi

