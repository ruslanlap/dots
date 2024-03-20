#!/bin/sh

# exist checks if a command exist in shell
exist() {
    command -v "$1" >/dev/null 2>&1
}

# log writes message to stdout with a timestamp in blue
log() {
    printf "\033[33;34m [%s] %s\n" "$(date)" "$1"
}

if [ -n "$CODESPACES" ]; then
    log "Exit. Skip run_once_install for codespaces."
    exit
fi

log "Running run_once_install-packages.sh once..."

# Install zsh
# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms
sudo apt install zsh --quiet

# Install Oh My Zsh
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null

# Install zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null

# Install p10k
# https://github.com/romkatv/powerlevel10k#homebrew
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# Install zsh-history-substring-search
# https://github.com/romkatv/powerlevel10k#homebrew
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH/custom/plugins/zsh-history-substring-search

# Install zsh-history-substring-search
# https://github.com/romkatv/powerlevel10k#homebrew
git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate
# Install fzf
# https://github.com/junegunn/fzf#using-homebrew
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install bat
# https://github.com/sharkdp/bat#on-macos-or-linux-via-homebrew
sudo apt install bat --quiet


curl -O https://raw.githubusercontent.com/ruslanlap/dotfiles/master/.p10k.zsh

chsh -s $(which zsh)


log "Done. Please restart your shell."
