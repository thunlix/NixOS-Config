{ pkgs, ... }:
{
  # Enable Foot terminal
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono:size=16";
        pad = "10x10";
      };
      colors = {
        alpha = 0;
      };
    };
  };

  # Enable Starship
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$character";
      character = {
        success_symbol = "[🞈](bright-green bold)";
        error_symbol = "[🞈](bright-red)";
        vicmd_symbol = "[🞈](bright-yellow)";
      };
      directory = {
        #format = "[]($style)[(bg:white fg:black)$path](bg:white>
        style = "bg:background fg:white";
      };
      git_branch = {
        #format = "[]($style)[[ ](bg:white fg:black bold)$bra>
        style = "bg:background fg:white";
      };
    };
  };
}
