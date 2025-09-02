{ config, pkgs, ... }:
{
  services.cloudflared.enable = false;
  environment.systemPackages = with pkgs; [
    cloudflared
  ];
}
