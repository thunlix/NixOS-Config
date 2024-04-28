{ pkgs, ... }:
{
  # Enable SDDM or LightDM
  # services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.sddm.enable = true;
}
