{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go-shadowsocks2
  ];
}
