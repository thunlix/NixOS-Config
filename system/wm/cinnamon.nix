{ pkgs, ... }:
{
  # Enable the X11 windowing system for Cinnamon.
  services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  services.xserver.desktopManager.cinnamon.enable = true;
}
