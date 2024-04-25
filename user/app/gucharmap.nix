{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gucharmap
  ];
}
