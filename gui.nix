{ config, pkgs, ... }:
# Graphical applications
{
  environment.systemPackages = with pkgs; [
    google-chrome
    # IDE
    vscode
    code-cursor
    zed-editor-fhs
    jetbrains-toolbox
    jetbrains.webstorm
    jetbrains.clion
    texstudio
    texliveFull
    # Terminal App
    alacritty
    kitty
    warp-terminal
    # social
    telegram-desktop
  ];
  # Install firefox
  programs.firefox.enable = true;
  programs.steam.enable = true;
}
