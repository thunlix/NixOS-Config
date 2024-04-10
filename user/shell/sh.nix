{ pkgs, ... }:
let
  myAliases = {
    ll = "ls -l"; 
  };
in
{
  # Configure .bashrc
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  # Configure .zshrc
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      theme = "ys";
    };
  };

  # Enable and configure fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      if status is-interactive
        /usr/local/bin/pokemon-colorscripts -r --no-title &
        starship init fish | source &
      end
    '';
  };

}
