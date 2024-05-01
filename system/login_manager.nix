{ pkgs, ... }:
{ 
  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners
    libsForQt5.qt5.qtgraphicaleffects
  ];
  # Enable SDDM or LightDM
  # services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-sddm-corners";
  };
}
