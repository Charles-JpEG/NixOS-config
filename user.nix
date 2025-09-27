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
      caffeinate = "systemd-inhibit --what=sleep:idle --who='ServerKeepAlive' --why='keep computer alive' sleep infinity";
    };
  };


  users.users.dev = {
    isNormalUser = true;
    description = "Develop user with no privilege";
    extraGroups = [ "docker" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      # Nothing
    ];
  };
}
