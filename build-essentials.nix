{ config, pkgs, ... }:
# Build utilities
{
  environment.systemPackages = with pkgs; [
    gcc
    cmake
    ninja
    # Extra
    libgcc
    pkg-config
    rustup
  ];
}
