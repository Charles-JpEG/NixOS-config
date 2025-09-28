# Define a user account. Don't forget to set a password with ‘passwd’.
{ config, pkgs, ... }:

{
  users.users.charles = {
    isNormalUser = true;
    description = "Charles Liu";
    extraGroups = [ "networkmanager" "docker" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      claude-code
    ];
  };

  # configure git default option
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";
      user.name = "Charles Liu";
      user.email = "charles2560710@gmail.com";
      pull.rebase = false;
    };
  };
}
