{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gucharmaps
  ];
}
