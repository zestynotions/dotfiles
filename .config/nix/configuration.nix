{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.video.hidpi.enable = true;

  networking.hostName = "nixos"; # Define your hostname.

  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl.driSupport.enable = true;
# hardware.enableAllFirmware = true;
# boot.kernelParams = [ "nomodeset" ];

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";
  networking.useDHCP = false;
  networking.interfaces.ens33.useDHCP = true;
  i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

users.users.zns = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel" "sway" "video"];
   };


fonts.fonts = with pkgs; [
     fira-code
     fira-code-symbols
     (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];


virtualisation.vmware.guest.enable = true;
xdg.portal.wlr.enable = true;
programs.sway.enable = true;

{config, pkgs, ...}: let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
in {
  imports = [
    hyprland.nixosModules.default
  ];
  
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.default;
  };
}

   nixpkgs.config.allowUnfree = true;
   nixpkgs.overlays = [
	(import (builtins.fetchTarball {
	url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
	}))
   ];

   environment.systemPackages = with pkgs; [
     neovim
     git
     curl
     swaylock
     swayidle
     wl-clipboard
     xwayland
     rsync
     killall
     gcc
     foot
     imv
     tmux
     bat
     exa
     broot
     zsh
     duf
     htop
     gotop
     pfetch
     open-vm-tools
     lf
     alacritty
     wofi
     wget
   ];

  # List services that you want to enable:
  services.openssh.enable = true;
}
