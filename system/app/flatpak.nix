{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    flatpak
    gnome.gnome-software
  ];

  # Enable Flatpak
  services.flatpak.enable = true;
}
