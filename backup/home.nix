{ config, pkgs, ... }:
let
  myAliases = {
    ll = "ls -l"; 
  };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "thunlix";
  home.homeDirectory = "/home/thunlix";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.podman
    pkgs.distrobox    
    pkgs.xorg.xhost
    pkgs.flatpak
    pkgs.gnome.gnome-software
    pkgs.fd
    pkgs.kitty
    pkgs.grim
    pkgs.slurp
    pkgs.swww
    pkgs.hyprpaper
    pkgs.polkit_gnome
    pkgs.ironbar
    pkgs.python3

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/thunlix/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

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

  # Enable Syncthing with tray icon
  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      command = "syncthingtray --wait";
    };
  };

  # Enable Librewolf browser
  programs.librewolf = {
    enable = true;
  };

  # Enable Emacs Editor
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
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

  # Enable Git
  programs.git = {
    enable = true;
    userName  = "Corbin Watkins";
    userEmail = "corbinrwatkins@protonmail.com";
  };

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
	format = "[]($style)[(bg:white fg:black)$path](bg:white fg:black)[ ]($style)";
	style = "bg:background fg:white";
      };
      git_branch = {
	format = "[]($style)[[ ](bg:white fg:black bold)$branch](bg:white fg:black)[ ]($style)";
	style = "bg:background fg:white";
      };
    };
  };

  # Enable idle manager for Wayland
  services.swayidle.enable = true;

  # Enable Swaylock
  programs.swaylock.enable = true;
  programs.swaylock.package = pkgs.swaylock-effects;

  # Enable Wofi
  programs.wofi.enable = true;  

  # Enable dunst
  services.dunst.enable = true;

  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    settings = {
      monitor = "DP-2, 3440x1440@160, 0x0, 1";
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
	"XDG_SESSION_TYPE,wayland"
	"GBM_BACKEND,nvidia-drm"
	"__GLX_VENDOR_LIBRARY_NAME,nvidia"
	"WLR_NO_HARDWARE_CURSORS,1"
      ];
      decoration = {
      	rounding = "10";
        blur = {
          enabled = true;
          size = "3";
          passes = "1";
          vibrancy = "0.1696";
        };
      	"col.shadow" = "rgba(00000099)";
        drop_shadow = true;
        shadow_range = "4";
        shadow_render_power = "3";
      };

      "$mod" = "SUPER";
      "$modA" = "ALT";
      "$terminal" = "footclient";
      "$fileManager" = "nemo";
      "$terminalFloat" = "$terminal --title fly_is_foot";
      "$drun" = "wofi --show drun";

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      bind = [
	"$mod, RETURN, exec, $terminal"
	"$modA, RETURN, exec, $terminalFloat"
	"$mod, space, exec, $drun"
        "$mod, Q, killactive,"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, V, togglefloating,"
	"$mod, left, workspace, r-1"
	"$mod, right, workspace, r+1"
	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$modA, 1, movetoworkspace, 1"
	"$modA, 2, movetoworkspace, 2"
	"$modA, 3, movetoworkspace, 3"
	"$modA, 4, movetoworkspace, 4"
	"$modA, 5, movetoworkspace, 5"
	"$mod, m, exit,"
      ];

      input = {
	kb_layout = "us";
      };

      general = {
        gaps_in = "5";
        gaps_out = "20";
        border_size = "2";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
     
      animations = {
	enabled = true;
      };
      
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      exec-once = [
	""
      ];

      exec = [
	"foot --server"
	"hyprpaper"
      ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
