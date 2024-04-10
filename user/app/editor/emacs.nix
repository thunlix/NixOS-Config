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
  services.emacs.extraOptions = ''
    "--with-native-compilation"
  '';

  # Enable Ripgrep - Used by Doom Emacs
  programs.ripgrep.enable = true;

  # Other supporting pkgs
  home.packages = with pkgs; [
    fd
    
  ];
}
