{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    shadowsocks-libev
  ];
}
