{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	position = "bottom";
	height = 35;
	spacing = 4;
	margin-top = 10;
	margin-bottom = 5;
	modules-left = [ "idle_inhibitor" "pulseaudio" "cpu" "memory" "temperature" ];
	modules-center = [ "custom/launcher" "custom/media" "wlr/taskbar" "custom/power" ];
	modules-right = [ "custom/layout" "custom/updater" "custom/snip" "backlight" "keyboard-state" "battery" "battery#bat2" "network" "tray" "clock" ];
	keyboard-state = {
	  numlock = true;
	  capslock = true;
	  format = " {name} {icon}";
	  format-icons = {
            locked = "";
            unlocked = "";
          };
	};
	"wlr/taskbar" = {
	  format = "{icon}";
	  icon-size = 20;
	  icon-theme = "Star";
	  tooltip-format = "{title}";
	  on-click = "minimize";
          on-click-middle = "close";
          on-click-right = "activate";
	};
	"sway/language" = {
    	  format = " {}";
    	};
    	"idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
        };
	tray = {
          icon-size = 20;
          spacing = 10;
        };
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
	temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };
    	backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" ""];
    	};
    	battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
    	};
    	"battery#bat2" = {
          bat = "BAT2";
    	};
	network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "Connected  ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          on-click-right = "bash ~/.config/rofi/wifi_menu/rofi_wifi_menu";
       };
       pulseaudio = {
         format = "{volume}% {icon}";
         format-bluetooth = "{volume}% {icon}";
         format-bluetooth-muted = "{icon} {format_source}";
         format-muted = "{format_source}";
         format-source = "";
         format-source-muted = "";
         format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
         };
         on-click = "pavucontrol";
       };
       "custom/media" = {
         format = "{icon} {}";
         return-type = "json";
         max-length = 15;
         format-icons = {
             spotify = " ";
             default = " ";
         };
         escape = true;
         exec = "$HOME/.config/system_scripts/mediaplayer.py 2> /dev/null";
         on-click = "playerctl play-pause";
       };
       "custom/launcher" = {
         format = " ";
         on-click = "rofi -show drun -theme ~/.config/rofi/wayfire/config.rasi";
         on-click-right = "killall rofi";
       };
       "custom/power" = {
         format = "  ";
         on-click = "nwg-bar";
         on-click-right = "killall nwg-bar";
       };
       "custom/layout" = {
         format = "";
         on-click = "bash ~/.config/system_scripts/layout.sh";
       };
      };
    };
   };
  };
}
