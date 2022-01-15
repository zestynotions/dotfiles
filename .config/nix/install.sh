#!/bin/bash

# Step 0 - Jump to User directory before Install
cd $HOME 

# Step 1 - install the nix store on the distribution
curl -L https://nixos.org/nix/install | sh

# Step 2 - Source the new invironment
. ~/.nix-profile/etc/profile.d/nix.sh

# Step 3 - Install packages
nix-env -iA \
  nixpkgs.zsh \
  nixpkgs.git \
  nixpkgs.neovim \
  nixpkgs.tmux \
  nixpkgs.espanso \
  nixpkgs.lf \
  nixpkgs.gotop \
  nixpkgs.duf \
  nixpkgs.htop \
  nixpkgs.broot \
  nixpkgs.ripgrep \
  nixpkgs.rsync \
  nixpkgs.exa


# Step 4 - Add zsh to list of shells and change user shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER


# Step 5 - Get dotfiles needed
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare https://github.com/zestynotions/dotfiles.git $HOME/.cfg
rm -rf .zshrc
rm -rf .gitignore
rm -rf .config
cfg -f checkout


# Step X chmod new zsh config
sudo chmod 777 .zshrc

# Step 7 - Ensure Neovim has packer pluin manager installed and update it
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
