if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Initializing tmux
if not set -q TMUX
    set -g TMUX tmux new-session -d -s WEODIMENSION
    eval $TMUX
    tmux attach-session -d -t WEODIMENSION
    tmux source ~/.tmux.conf
end

starship init fish | source
zoxide init fish | source
export  PATH="~/.config/bin:$PATH"
export  PATH="~/.local/bin:$PATH"
source "$HOME/.cargo/env.fish"

# TO ENABLE fzf KEYBINDINGS
eval "$(fzf --fish)"

# Setup previews with fzf
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function 
# - The first argument to the funciton is the name of the command
# - You should make sure to pass the rest of the arguments to fzf.

eval "$(thefuck --alias fk)"

## SETS
set -gx NVM_DIR $HOME/.nvm
## TO SET NVIM AS SUDOEDIT EDITOR
set -Ux EDITOR nvim
set -Ux SUDO_EDITOR nvim
set -Ux VISUAL nvim

### ALIASES GO HERE
alias fishrc 'nvim ~/.config/fish/config.fish'
alias rload_fish 'source ~/.config/fish/config.fish'
alias nvrc 'nvim ~/.config/nvim/'
alias clone 'git clone'
alias q 'exit'
alias zyp 'sudo zypper'
alias zypse 'sudo zypper se'
alias sysUpt 'sudo zypper dup'
alias compFolder 'zip -r'
alias weo2go 'ssh weo2go'
alias ls 'eza --color=always --long --git --no-filesize --icons=always --no-time --no-user'
alias cd 'z'
alias colemak 'xmodmap ~/keymaps/qwerty/.Xmodmap'
alias qwerty 'xmodmap ~/keymaps/.Xmodmap'
alias TAMUDrive 'cd /run/user/1000/gvfs/smb-share:server=storage.continuum.tamu.edu,share=web/S-1-5-21-1167378736-2199707310-2242153877-1032325/public_html'


# Nifty for school
alias googVM 'ssh -i ~/.ssh/google_vm lfexp35@35.223.84.22'
alias discord 'flatpak run com.discordapp.Discord'

# For binary compiled languages
alias zig '~/zig/./zig'
# Function to make vi an intuative alias
function vi 
    if [ -z "$argv" ] # No Args
        nvim 
        echo "Closing WEOVIM..."
        return
    else if test "$argv[1]" = "."
        nvim .
        echo "Closing WEOVIM..."
        return
    else
        nvim $argv[1]
        echo "Closing WEOVIM..."
        return
    end
end


function vc 
    if [ -z "$argv" ] # No Args
        NVIM_APPNAME=nvchad nvim 
        echo "Closing NvChad..."
        return
    else
        NVIM_APPNAME=nvchad $argv[1]
        return
    end
end


function vl 
    if [ -z "$argv" ] # No Args
        NVIM_APPNAME=nvimlazy nvim 
        echo "Closing LazyVim..."
        return
    else
        NVIM_APPNAME=nvimlazy nvim $argv[1]
        return
    end
end



eval neofetch

function fish_greeting
    echo !WEOWEOMASCHINEE!
    echo Well, well, well...
    echo "I'm here as well huehuehuheuheuhehue <(´v｀)^"
end



set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/weoweo/.ghcup/bin $PATH # ghcup-env
