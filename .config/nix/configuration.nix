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

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  # services.xserver = {
  #  layout = "us";
  #  xkbVariant = "";
  # };


# Enable sound with pipewire.
# sound.enable = true;
# security.rtkit.enable = true;
# services.pipewire = {
#  enable = true;
#  alsa.enable = true;
#  alsa.support32Bit = true;
#  pulse.enable = true;
#  jack.enable = true;
# };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zns = {
    isNormalUser = true;
    description = "zns";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "zns";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  xdg.portal.wlr.enable = true;

  programs.hyprland = {
  enable = true;
  xwayland.enable = true;
  }

  # Fonts
  fonts.packages = with pkgs; [
  fira-code
  jetbrains-mono
  (nerdfonts.override { fonts = [ "FiraCode" ];})
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  fira-code-nerdfont
  jetbrains-mono
  wget
  xwayland
  networkmanagerapplet
  hyprpaper
  waybar
  brave
  git
  bat
  eza
  gcc
  skim
  fd
  neovim
  starship
  tmux
  wl-clipboard
  wezterm
  foot
  imv
  tofi
  zsh
  zoxide
  duf
  htop
  btop
  macchina
  pfetch
  yazi
  ];

#  nix.gc = {
#  automatic = true;
#  dates = "weekly";
#  options = "--delete-generations 5d";
#  }

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}
