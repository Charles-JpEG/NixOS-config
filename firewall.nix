# Firewall configurations
{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3200 ];
    allowedUDPPorts = [ ];
  };
}
