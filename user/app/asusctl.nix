{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    asusctl
  ];
  services.asusd.enable = true;
}
