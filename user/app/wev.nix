{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wev
  ];
}