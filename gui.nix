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
    # social
    telegram-desktop
    # Not actually graphical app
    woeusb  # Better bootable disk creator
  ];
  # Install firefox
  programs.firefox.enable = true;
}
