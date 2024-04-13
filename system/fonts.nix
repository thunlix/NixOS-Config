{ pkgs, ... }:
{
  # Add fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    nerdfonts
  ];
}
