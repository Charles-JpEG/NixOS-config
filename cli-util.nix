{ config, pkgs, ... }:
# CLI utility
{
  environment.systemPackages = with pkgs; [
    # CLI Visual
    bat
    eza
    jq
    btop
    fd  # alternative of find
    ripgrep  # blazing fast alternative of grep
    wl-clipboard  # clipboard provider for nvim
    neovim
  ];
}
