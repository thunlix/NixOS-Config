{ pkgs, ... }:
{
  # Enable Syncthing with tray icon
  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      command = "syncthingtray --wait";
    };
  };
}
