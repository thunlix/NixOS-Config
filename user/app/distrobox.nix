{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    podman
    distrobox
    xorg.xhost
  ];

  #virtualisation.podman = {
  #  enable = true;
  #  dockerCompat = true;
  #  defaultNetwork.settings.dns_enabled = true;
  #};
}
