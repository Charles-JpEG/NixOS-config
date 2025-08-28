# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      <nixos-wsl/modules>
      ./user.nix
      ./cli-util.nix
      ./build-essentials.nix
      ./firewall.nix
    ];

  # WSL
  wsl.enable = true; 

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ] ++ [
    docker
    qemu
    # Python dependencies
    (python313.withPackages (python-pkgs: with python-pkgs; [
      numpy
    ]))
  ];

  # Enable nix-command and flakes btw
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Enable scheduled nix store optimiser
  nix.optimise.automatic = true;

  # Set default editor  to vim, and config tabstop
  environment.variables.EDITOR = "vim";
  
  security.sudo.extraConfig = ''
    Defaults env_keep += "EDITOR"
    Defaults editor = /run/current-system/sw/bin/vim
  '';
  

  # List services that you want to enable:
  virtualisation.docker.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
