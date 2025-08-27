
# Define a user account. Don't forget to set a password with ‘passwd’.
{ config, pkgs, ... }:

{
  users.users.charles = {
    isNormalUser = true;
    description = "Charles Liu";
    extraGroups = [ "networkmanager" "docker" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
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
    woeusb  # Better bootable disk creator
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

    shellAliases = {  # depends on cli-util
      ll = "eza -l --icons";
      la = "eza -la --icons";
      showpath = "echo $PATH | tr ':' '\n'";
    };
  };
}
