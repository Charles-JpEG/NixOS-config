{ config, pkgs, ... }:
{
  services.cloudflared.enable = enable;
  environment.systemPackages = with pkgs; [
    cloudflared
  ];
}
