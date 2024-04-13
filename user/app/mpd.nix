{ pkgs, config, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/thunlix/Music";
    network.listenAddress = "any";
    startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
