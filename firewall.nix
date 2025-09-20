# Firewall configurations
{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 4444 3200 7844 ];
    allowedUDPPorts = [ 7844 ];
  };
}
