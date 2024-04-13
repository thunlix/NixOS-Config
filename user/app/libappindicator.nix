{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libappindicator
  ];
}
