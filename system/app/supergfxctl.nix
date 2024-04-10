{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    supergfxctl
  ];

  # Enable supergfxd
  services.supergfxd.enable = true;
}
