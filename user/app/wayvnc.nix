{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wayvnc
  ];
}
