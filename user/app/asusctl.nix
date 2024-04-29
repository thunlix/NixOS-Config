{ pkgs, config, ... }:
{
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
};
}
