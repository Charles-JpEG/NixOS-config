
# Define a user account. Don't forget to set a password with ‘passwd’.
{ config, pkgs, ... }:
{
  users.users.charles = {
    isNormalUser = true;
    description = "Charles Liu";
    extraGroups = [ "networkmanager" "docker" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [

      # LLVM --
      # (import ./build-llvm.nix { inherit pkgs; })  # custom build from github 
      # llvmPackages_21.llvm
      # llvmPackages_21.clang
      # llvmPackages_21.clang-tools # e.g. clangd clang-format clang-tidy
      # llvmPackages_21.lldb
      # llvmPackages_21.lld
      # --

      # IDE
      vscode
    ];
  };
}
