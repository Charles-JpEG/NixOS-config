# Firewall configurations
{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 21 25 ];
    allowedUDPPorts = [ 53 67 68 123 ];
    allowedTCPPortRanges = [
      { from = 32768; to = 65535; }
    ];
  };
}
