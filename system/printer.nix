{ pkgs, ... }:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Printer Auto-discovery
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
