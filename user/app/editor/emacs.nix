{ config, pkgs, ... }:
{
  # Enable Emacs Editor
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a>
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };
  
  # Ensure Native Comp for Emacs
  #services.emacs.extraOptions = ''
  #  "--with-native-compilation"
  #'';

  # Enable Ripgrep - Used by Doom Emacs
  programs.ripgrep.enable = true;
  
  # Enable emacs server daemon
  services.emacs.enable = true;
  #services.emacs.package = import /home/thunlix/.emacs.d { pkgs = pkgs; };
  #services.emacs.install = true;

  # Enable pandoc
  programs.pandoc.enable = true;
  
  # Other supporting pkgs
  home.packages = with pkgs; [
    fd
    shellcheck
  ];
}
