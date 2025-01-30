### Start TMUX
# if [[ "$TMUX" = "" ]]; then;
#     TMUX="tmux new-session -d -s WEODIMENSION"
#     eval "$TMUX"
#     tmux attach-session -d -t WEODIMENSION
#     tmux source ~/.tmux.conf
# fi

if [ "$(tty)" = "/dev/tty1" ];then
  exec dbus-run-session hyprland
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



### SHELL INTEGRATIONS ###
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
export PATH="~/.config/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export MAVEN_HOME="/home/weoweowsl/apache-maven-3.9.9/"
PATH=$PATH:$MAVEN_HOME/bin
export JFX_PATH="/home/weoweo/binaries/javafx-sdk-22.0.2/lib"
export JAVA_HOME="/usr/lib64/jvm/java-23-openjdk-23/"

# Defaults
export EDITOR="nvim"
export SUDO_EDITOR="/usr/local/bin/nvim"
export TERMINAL="st"
export BROWSER="zen-browser"

# Setup previews with fzf
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

autoload -U compinit; compinit
### END OF INTEGRATIONS ###


### ------------- PLUG-INS --------------- ###
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
#### -------------- END OF PLUG-INS ---------###

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)EZA_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview 'ls $realpath'

### ---------- ALIASES ----------- ###
alias ..="cd ../"
alias ...="cd ../; cd ../;"
alias ....="cd ../; cd ../; cd ../;"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user"
alias fishrc="nvim ~/.config/fish/config.fish"
alias szshrc="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias q="exit"
alias zyp="sudo zypper"
alias zypse="zypper se"
alias sysUpt="sudo zypper dup"
alias qwerty="xmodmap ~/keymaps/qwerty/.Xmodmap"
alias colemak="xmodmap ~/keymaps/.Xmodmap"
alias TAMUDrive='cd /run/user/1000/gvfs/smb-share:server=storage.continu      um.tamu.edu,share=web/S-1-5-21-1167378736-2199707310-2242153877-1032325/      public_html'
alias nvrc="nvim ~/.config/nvim/"
alias rf="ranger"
alias mixer="pulsemixer"

# Nifty for school
alias googVM='ssh -i ~/.ssh/google_vm lfexp35@35.223.84.22'
alias discord='flatpak run com.discordapp.Discord'

# Makefiles
alias makeBuild='~/.scripts/buildTemplates/create.sh'

# Database (School)
alias proj_db='psql -h csce-315-db.engr.tamu.edu -p 5432 -U csce331_12 -d csce331_12'
alias zig='~/zig/./zig'

# Code wit Me (intelliJ)
alias co_auth='~/.scripts/github/co_auth.sh'

# Second Monitor shenanigans
alias dup_mon='xrandr --output eDP-1 --mode 2880x1620 --rate 120.00 --output HDMI-1 --same-as eDP-1 --scale-from 2880x1620'

#----------------- FUNCTIONS ----------------#

vi() {
    if [[ -z "$argv" ]]; then
        nvim
        echo "!Closed WEOVIM!"
        return
    elif [[ "$argv[1]" = "." ]]; then
        nvim .
        echo "!Closed WEOVIM!"
        return
    else 
        nvim $argv[1]
        echo "!Closed WEOVIM!"
        return
    fi
}

vc() {
    if [[ -z "$argv" ]]; then
        NVIM_APPNAME=nvchad nvim
        echo "!Closed NvChad!"
        return
    elif [[ "$argv[1]" = "." ]]; then
        NVIM_APPNAME=nvchad nvim .
        echo "!Closed NvChad!"
        return
    else 
        NVIM_APPNAME=nvchad nvim $argv[1]
        echo "!Closed NvChad!"
        return
    fi
}

vl() {
    if [[ -z "$argv" ]]; then
        NVIM_APPNAME=nvimlazy nvim
        echo "!Closed LazyVim!"
        return
    elif [[ "$argv[1]" = "." ]]; then
        NVIM_APPNAME=nvimlazy nvim .
        echo "!Closed LazyVim!"
        return
    else 
        NVIM_APPNAME=nvimlazy nvim $argv[1]
        echo "!Closed LazyVim!"
        return
    fi
}

##--------------END OF ALIASES/FUNCTIONS----------------##


## KEYBINDINGS
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
setopt auto_cd

HISTSIZE=5000
HISTFILE=~/.config/.zsh_hist
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/weoweo/.bun/_bun" ] && source "/home/weoweo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
