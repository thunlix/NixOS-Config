{ pkgs, ... }:
{
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      input.method = "alsa";
      smoothing.noise_reduction = 88;
      color = {
        background = "'#000000'";
        foreground = "'#FFFFFF'";
      };
    };
  };
}
