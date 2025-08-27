# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./user.nix
      ./audio.nix
      ./ssh-server.nix
      ./firewall.nix
      ./cloudflared.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gcc
    libgcc
    cmake
    ninja
    cargo

    # Python dependencies
    (python313.withPackages (python-pkgs: with python-pkgs; [
      # dependencies of howdy
      numpy
      # dlib
      # (opencv4.override {
      #   enableGtk2 = true;
      #   enableGtk3 = true;
      # })
    ]))

    pkg-config
    gtk4

    # CLI Visual
    bat
    eza
    jq
    btop
    fd  # alternative of find
    ripgrep  # blazing fast alternative of grep
    wl-clipboard  # clipboard provider for nvim
    neovim

    docker

    # GUI applications
    google-chrome
  ];

  # Update PATH
  # environment.variables = {
  #   PATH = "/usr/local/bin:$PATH";
  # };

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
  
  environment.etc."vimrc".text = ''
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set softtabstop=2
    # set autoindent
    set smartindent
  '';


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
