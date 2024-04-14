{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-font-viewer
  ];
}
