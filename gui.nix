{ config, pkgs, ... }:
# Graphical applications
{
  environment.systemPackages = with pkgs; [
    google-chrome
    # IDE
    vscode
    zed-editor-fhs
    jetbrains-toolbox
    jetbrains.webstorm
    jetbrains.clion
    texstudio
    texliveFull
    # Terminal App
    alacritty
    # social
    telegram-desktop
    # vbox module
    linuxKernel.packages.linux_6_16.virtualbox
  ];
  # Install firefox
  programs.firefox.enable = true;
  programs.steam.enable = true;
  # VM
  # virtualbox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "charles" ];
  boot.blacklistedKernelModules = [ "kvm" "kvm_intel" ];
}
