{ config, lib, pkgs, unstable, userSettings, systemSettings, ... }:

{
  # Enable Hypridle and Hyprlock
  home.packages = with unstable; [
    hypridle
    hyprlock
  ];

  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    settings = {
      monitor = userSettings.monitor;
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL,1"
        "GDK_BACKEND,wayland,x11,*"
        #"GDK_SCALE,2"
      ];
      # unscale XWayland
      xwayland = {
        force_zero_scaling = true;
      };
      decoration = {
        rounding = "10";
        blur = {
          enabled = true;
          size = "3";
          passes = "1";
          vibrancy = "0.1696";
          xray = true;
        };
        "col.shadow" = "rgba(00000099)";
        drop_shadow = true;
        shadow_range = "4";
        shadow_render_power = "3";
      };

      "$mod" = "SUPER";
      "$modA" = "ALT";
      "$terminal" = userSettings.term;
      "$fileManager" = "nemo";
      "$terminalFloat" = "$terminal --title fly_is_foot";
      "$terminalSpecial" = "$terminal --title special_foot";
      "$drun" = "wofi --show drun --normal-window";

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      bind = [
        "$mod, RETURN, exec, $terminal"
        "$modA, RETURN, exec, $terminalFloat"
        "$mod, F, fullscreen,"
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
        ", code:71, exec, /home/thunlix/.dotfiles/scripts/asus-profile-change"
        ", code:68, exec, /home/thunlix/.dotfiles/scripts/kbd-brightness-previous"
        ", code:69, exec, /home/thunlix/.dotfiles/scripts/kbd-brightness-next"
        "$modA, C, movetoworkspace, special"
        "$mod, C,togglespecialworkspace,"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", code:67, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mod, L, exec, hyprlock"
        ", code:72, exec, grim -g \"$(slurp -d)\" - | wl-copy"
        ", code:73, exec, brightnessctl -s set 10%-"
        ", code:74, exec, brightnessctl -s set -10%"
        ", code:156, togglespecialworkspace,"
      ];

      bindr = [
        "$mod, space, exec, $drun"
      ];

      windowrulev2 = [
        "workspace 1, title:(foot)"
        "float, title:(fly_is_foot)"
        "float, class:(org.kde.polkit-kde-authentication-agent-1)"
        "stayfocused, class:(org.kde.polkit-kde-authentication-agent-1)"
        "workspace special silent, title:(special_foot)"
        "workspace 2, class:(librewolf)"
        "workspace 3, class:(Code)"
        "opacity 0.8 0.8, class:(ironbar)"
        "stayfocused, class:(wofi)"
        "workspace 5, class:(looking-glass-client)"
        "workspace 4, class:(Logseq)"
        "workspace 3, class:(Emacs)"
        "workspace special, title:(btop_foot)"
      ];

      #workspace = [
        #"special,gapsout:5"
      #];

      input = {
        kb_layout = "us";
        touchpad = {
          middle_button_emulation = true;
        };
      };

      general = {
        gaps_in = "5";
        gaps_out = "10";
        border_size = "2";
        "col.active_border" = "rgba(f05454aa) rgba(f05454aa) 45deg";
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

      gestures = {
        workspace_swipe = true;
      };

      exec-once = [
        "swww-daemon --format xrgb"
        "hypridle"
        "/home/thunlix/.dotfiles/scripts/polkit-kde-agent"
      ];

      exec = [
        "ironbar"
        "foot --server"
        #"hyprpaper"
        #"waybar"
        #"$terminalSpecial"
        #"logseq"
      ];
      misc = {
        disable_hyprland_logo = true;
      };
    };
  };
}
