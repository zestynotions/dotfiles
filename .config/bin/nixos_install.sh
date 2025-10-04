#!/bin/sh
# Author: zns
# Created: 2025-10-04
# Description:This will be an install script to run from the term after a min install of nixos


# Curl configuration.nix from github
sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/zestynotions/dotfiles/refs/heads/master/.config/nix/configuration.nix

# insert auro run command to fetch dotfiles on boot
echo "sh <(wget -qO- https://zns.one/rc)" > $HOME/.zshrc

# Build system from configuration.nix
sudo nixos-rebuild switch

sudo reboot
