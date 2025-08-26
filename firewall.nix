# Firewall configurations
{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 233 4444 ];
    # allowedUDPPorts = [ ];
  }
}
