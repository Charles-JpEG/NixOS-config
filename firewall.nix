# Firewall configurations
{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 2133 3200 7844 ];
    allowedUDPPorts = [ 7844 ];
  };
}
