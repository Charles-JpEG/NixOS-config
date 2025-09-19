{ config, pkgs, ... }:
# Configure power settings
{
  services.logind = {
    # lidSwitch = "ignore";
    # lidSwitchDocked = "ignore";  # Default at 25.05
    # lidSwitchExternalPower = "ignore";  # Default at 25.05
    powerKey = "hibernate";

    # kill user's processes at logout, false by default
    killUserProcesses = false;
  };
}
