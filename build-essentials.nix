{ config, pkgs, ... }:
# Build utilities
{
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    cmake
    ninja
    # Extra
    cling
    lldb_21
    llvmPackages_21.clang
    llvmPackages_21.libcxx
    libgcc
    pkg-config
    rustup
  ];
}
