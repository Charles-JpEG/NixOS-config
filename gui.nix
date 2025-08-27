{ config, pkgs, ... }:
# Graphical applications
{
  environment.systemPackages = with pkgs; [
    google-chrome
  ];
  # Install firefox
  programs.firefox.enable = true;
}
