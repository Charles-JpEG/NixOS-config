# Sould Configurations
{ config, pkgs, lib, ... }:

{
  # Install firmwares
  hardware.firmware = with pkgs; [
    linux-firmware
    sof-firmware
  ];

  # services.pulseaudio = {
  #   enable = true;
  #   support32Bit = true;
  #   package = pkgs.pulseaudioFull;
  # };

  # Enable sound with pipewire
  # services.pipewire.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    alsa-lib
    alsa-plugins
    alsa-utils
  ];
}
