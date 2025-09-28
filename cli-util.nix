{ config, pkgs, ... }:
# CLI Visual
{
  environment.systemPackages = with pkgs; [
    bat
    eza
    jq
    btop
    fd  # alternative of find
    ripgrep  # blazing fast alternative of grep
    wl-clipboard  # clipboard provider for nvim
    neovim
    starship
  ];
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    plugins = with pkgs.tmuxPlugins; [
      nord
      # tmux-floax
    ];
    extraConfigBeforePlugins = ''
      # true colour
      set -ga terminal-overrides ",*-256color:Tc"
    '';
    extraConfig = ''
      # open panes from cwd
      bind '"' split-window -v -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"

      # open windows from cwd
      bind c new-window -c "#{pane_current_path}"
    '';
  };

  programs.zoxide = {
    enable = true;
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

  # Configure fish and integrate zoxide
  programs.fish = {
    enable = true;
    promptInit = ''
      starship preset gruvbox-rainbow -o ~/.config/starship.toml
      eval $(starship init fish)
      zoxide init fish | source
    '';
  };
}
