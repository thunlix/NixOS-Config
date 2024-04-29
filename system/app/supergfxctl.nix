{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    supergfxctl
    lsof
  ];

  # Enable supergfxd
  services.supergfxd.enable = true;
}
