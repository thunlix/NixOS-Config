{ pkgs, ... }:
{
  home.packages = with pkgs; [
    youtube-dl
  ];
}
