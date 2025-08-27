
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

      vscode
      jetbrains-toolbox
      jetbrains.webstorm
      jetbrains.clion
      qemu

      # social
      telegram-desktop
    ];
  };

  # Development programs
  environment.systemPackages = with pkgs; [
    # IT utility
    woeusb
  ];

  # configure zsh, plugins and aliases
  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "avit";
    };

    shellAliases = {
      ll = "eza -l --icons";
      la = "eza -la --icons";
      showpath = "echo $PATH | tr ':' '\n'";
    };
  };
}
