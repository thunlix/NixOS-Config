{ pkgs, config, ... }:
{
  networking.useDHCP = false;
  networking.interfaces.wlp4s0.useDHCP = true;
  networking.interfaces.br0.useDHCP = false;
  networking.bridges = {
    "br0" = {
      interfaces = [ "wlp4s0" ];
    };
  };
  networking.interfaces.br0.ipv4.addresses = [ {
    address = "192.168.42.12";
    prefixLength = 24;
  } ];
  networking.defaultGateway = "192.168.42.1";
  networking.nameservers = ["192.168.42.1"];
}
