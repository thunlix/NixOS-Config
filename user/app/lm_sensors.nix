{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lm_sensors
  ];
}
