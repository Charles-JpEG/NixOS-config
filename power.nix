{ config, pkgs, ... }:
# Configure power settings
{
  services.logind = {
    lidSwitch = "ignore";
    lidSwitchDocked = "ignore";  # Default at 25.05
    lidSwitchExternalPower = "ignore";  # Default at 25.05
    powerKey = "hibernate";

    # kill user's processes at logout, false by default
    killUserProcesses = false;
  };
  # Disable system default power management
  systemd.targets.sleep.enable = true;
  systemd.targets.suspend.enable = true;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = true;
}
