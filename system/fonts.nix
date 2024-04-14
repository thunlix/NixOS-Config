{ pkgs, ... }:
{
  # Add fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    nerdfonts
    fira-code
    fira-code-symbols
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
