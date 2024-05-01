{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    auto-cpufreq
  ];

  # Enable auto-cpufreq daemon
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    charger = {
      turbo = "never";
    };
    battery = {
      turbo = "never";
    };
  };
}
