{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
  ];
}
