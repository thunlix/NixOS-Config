{ pkgs, config, ... }:
{
  programs.looking-glass-client.enable = true;
  #programs.looking-glass-client.settings = {
  #  app = {
  #    allowDMA = true;
  #    shmFile = "/dev/kvmfr0";
  #  };
  #};
}
