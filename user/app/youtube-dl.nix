{ pkgs, unstable, ... }:
{
  home.packages = with unstable; [
    youtube-dl
  ];
}
