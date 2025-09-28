# Proxy related settings
{ config, pkgs, ... }:

{
  services.tailscale.enable = true;
  services.cloudflare-warp.enable = true;
}
