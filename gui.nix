{ config, pkgs, ... }:
# Graphical applications
{
  environment.systemPackages = with pkgs; [
    google-chrome
    # IDE
    vscode
    jetbrains-toolbox
    jetbrains.webstorm
    jetbrains.clion
    # Terminal App
    alacritty
    # social
    telegram-desktop
  ];
  # Install firefox
  programs.firefox.enable = true;
  programs.steam.enable = true;
}
