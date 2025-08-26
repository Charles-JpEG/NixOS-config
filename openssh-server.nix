# OpenSSH daemon config
{
  services.openssh = {
    enable = true;

    ports = [ 22 ];
    settings = {
      # Disable root login
      PermitRootLogin = "no";
      
      # Disable password authentication (use keys only)
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      
      # Other security settings
      PermitEmptyPasswords = false;
      X11Forwarding = false;
    };

    # Host keys for host identification
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];

  };

  # Allowed keys
  users.users.charles = {
    openssh.authorizedKeys.keys = [
      # Add keys here
    ];
  };

  # Open firewall for SSH
  networking.firewall.allowedTCPPorts = [ 22 ];
}
