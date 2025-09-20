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
}
