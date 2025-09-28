# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;


nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Sound
security.rtkit.enable = true; # Recommended for improved performance
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  wireplumber.enable = true;
  # Uncomment the following line if you want to use JACK applications
  # jack.enable = true;
};

nix.gc = {
automatic = true;
dates = "weekly";
options= "--delete-older-than 1w";
};


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;

networking.interfaces.enp3s0 = {
  useDHCP = false;
  ipv4.addresses = [
    {
      address = "10.0.0.100";
      prefixLength = 24;
    }
  ];
};

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zns = {
    isNormalUser = true;
    description = "zns";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "pipewire" ];
    packages = with pkgs; [];
  };


  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];


programs.hyprland.enable = true;
programs.zsh.enable = true;
hardware.graphics.enable = true;

  # Enable automatic login for the user.
  services.getty.autologinUser = "zns";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # xdg.portal.wlr.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
brave
neovim
wget
zsh
xwayland
hyprpaper
hyprland
waybar
git
bat
fd
eza
zoxide
starship
btop
skim
wezterm
foot
wl-clipboard
tofi
duf
htop
jetbrains-mono
pfetch
macchina
vlc
pavucontrol
wireplumber
yazi
  ];


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
 services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
