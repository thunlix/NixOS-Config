{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      * {
    border: none;
    border-radius: 0px;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: Roboto, Helvetica, Arial, sans-serif;
    font-size: 13px;
    min-height: 0;
}

window#waybar {
    background-color: transparent;
    color: black;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}


#workspaces button {
    background: #1f1f1f;
    color: black;
    border-radius: 20px;

}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    background: lightblue;
    color: black;
    border-bottom: 3px solid black;

}

#workspaces button.focused {
    background: #1f1f1f;
}

#workspaces button.focused:hover {
    background: lightblue;
    color: black;
    border-bottom: 3px solid black;

}

#workspaces button.urgent {
    background-color: #eb4d4b;
}

#mode {
    background-color: #64727D;
    border-bottom: 3px solid black;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#custom-media,
#custom-launcher,
#custom-power,
#custom-layout,
#custom-updater,
#custom-snip,
#taskbar,
#tray,
#mode,
#idle_inhibitor,
#mpd {
    padding: 0 10px;
    color: black;
}

#window,
#workspaces {
    margin: 0px 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0px;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0px;
}

#clock {
    background-color: #FA8BFF;
    background-image: linear-gradient(-45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
    border-radius: 0px 20px 20px 0px;
    margin-right: 4px;

}

#battery {
    background-color: black;
    color: #000000;
}

#battery.charging, #battery.plugged {
    color: black;
    background-color: #26A65B;
}

@keyframes blink {
    to {
        background-color: black;
        color: #000000;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: black;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
    background-color: #000000;
}

#cpu {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#memory {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#disk {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#backlight {
    background-color: #90b1b1;
}

#network {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#network.disconnected {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: red;
}

#pulseaudio {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#pulseaudio.muted {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: red;
}

#custom-media {
    background-color: #8EC5FC;
    background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);
    color: black;
    border-radius: 20px;
    margin-right: 5px;
    margin-left: 5px;
}

#custom-media.custom-spotify {
    background-color: #8EC5FC;
    background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);
    color: black;
    border-radius: 20px;
    margin-right: 5px;

}

#custom-media.custom-vlc {
    background-color: #8EC5FC;
    background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);
    color: black;
    border-radius: 20px;
    margin-right: 5px;
}

#custom-power{
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    font-size: 18px;
    border-radius: 20px;
    margin-left: 2px;
}

#custom-launcher{
    background-color: #FA8BFF;
    background-image: linear-gradient(-45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    font-size: 25px;
    border-radius: 20px;
    margin-right: 2px;
}

#custom-updater {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#custom-snip {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
    font-size: 20px;
}

#custom-layout{
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
    font-size: 18px;
    border-radius: 20px 0px 0px 20px;
}

#taskbar {
    background-color: #2BD2FF;
    background-image: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #FA8BFF 90%);
    border-radius: 20px;

}


#temperature {
    background-color: #FA8BFF;
    background-image: linear-gradient(-45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
    border-radius: 0px 20px 20px 0px;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#tray {
    background-color: #FA8BFF;
    background-image: linear-gradient(-45deg, #2BD2FF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#tray > .passive {
    -gtk-icon-effect: dim;
    background-color: #FA8BFF;
    background-image: linear-gradient(-45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #FA8BFF;
    background-image: linear-gradient(-45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
}

#idle_inhibitor {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    border-radius: 20px 0px 0px 20px;

}

#idle_inhibitor.activated {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
    border-radius: 20px 0px 0px 20px;

}

#language {
    background-color: #FA8BFF;
    background-image: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BD2FF 90%);
    color: black;
    min-width: 16px;
    padding-left : 8px;
    border-radius: 20px 0px 0px 20px;
}

#keyboard-state {
    background: #97e1ad;
    color: #000000;
    min-width: 16px;
}

#keyboard-state > label {
    padding: 0px 5px;
}

#keyboard-state > label.locked {
    background: rgba(0, 0, 0, 0.2);
}
    '';
    settings = {
      mainbar = {
    "layer": "top",
    "position": "bottom",
    "height": 35,
    "spacing": 4,
    "margin-top": 10,
    "margin-bottom":5,

    // Choose the order of the modules

    "modules-left":[  "idle_inhibitor", "pulseaudio", "cpu", "memory", "temperature"],
    "modules-center": [ "custom/launcher", "custom/media","wlr/taskbar", "custom/power"],
    "modules-right":["custom/layout", "custom/updater", "custom/snip", "backlight", "keyboard-state",  "battery", "battery#bat2", "network", "tray",  "clock"],
    // Modules configuration

    "keyboard-state": {
        "numlock": true,
        "capslock": true,
        "format": " {name} {icon}",
        "format-icons": {
            "locked": "",
            "unlocked": ""
        }
    },
     "wlr/taskbar": {
        "format": "{icon}",
        "icon-size": 20,
        "icon-theme": "Star",
        "tooltip-format": "{title}",
        "on-click": "minimize",
        "on-click-middle": "close",
        "on-click-right": "activate"
    },
   "sway/language": {
    "format": " {}",
    },
    "idle_inhibitor": {
        "format": "{icon}",
        "format-icons": {
            "activated": "",
            "deactivated": ""
        }
    },
    "tray": {
        "icon-size": 20,
        "spacing": 10
    },
    "clock": {
        // "timezone": "America/New_York",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format-alt": "{:%Y-%m-%d}"
    },
    "cpu": {
        "format": "{usage}% ",
        "tooltip": false
    },
    "memory": {
        "format": "{}% "
    },
    "temperature": {
        // "thermal-zone": 2,
        // "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
        "critical-threshold": 80,
        // "format-critical": "{temperatureC}°C {icon}",
        "format": "{temperatureC}°C {icon}",
        "format-icons": ["", "", ""]
    },
    "backlight": {
        "format": "{percent}% {icon}",
        "format-icons": ["", ""]
    },
    "battery": {
        "states": {
            // "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{capacity}% {icon}",
        "format-charging": "{capacity}% ",
        "format-plugged": "{capacity}% ",
        "format-alt": "{time} {icon}",
        "format-icons": ["", "", "", "", ""]
    },
    "battery#bat2": {
        "bat": "BAT2"
    },
    "network": {
        // "interface": "wlp2*", // (Optional) To force the use of this interface
        "format-wifi": "{essid} ({signalStrength}%) ",
        "format-ethernet": "Connected  ",
        "tooltip-format": "{ifname} via {gwaddr} ",
        "format-linked": "{ifname} (No IP) ",
        "format-disconnected": "Disconnected ⚠",
        "format-alt": "{ifname}: {ipaddr}/{cidr}",
        "on-click-right": "bash ~/.config/rofi/wifi_menu/rofi_wifi_menu"

    },
    "pulseaudio": {
        "format": "{volume}% {icon}",
        "format-bluetooth": "{volume}% {icon}",
        "format-bluetooth-muted": "{icon} {format_source}",
        "format-muted": "{format_source}",
        "format-source": "",
        "format-source-muted": "",
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "on-click": "pavucontrol"
    },
    "custom/media": {
        "format": "{icon} {}",
        "return-type": "json",
        "max-length": 15,
        "format-icons": {
            "spotify": " ",
            "default": " "
        },
        "escape": true,
        "exec": "$HOME/.config/system_scripts/mediaplayer.py 2> /dev/null",
        "on-click": "playerctl play-pause"
    },
    "custom/launcher":{
        "format": " ",
        "on-click": "rofi -show drun -theme ~/.config/rofi/wayfire/config.rasi",
        "on-click-right": "killall rofi"
    },
    "custom/power":{
        "format": "  ",
        "on-click": "nwg-bar",
        "on-click-right": "killall nwg-bar"
    },
    "custom/layout":{
        "format": "",
        "on-click": "bash ~/.config/system_scripts/layout.sh"
    },
    "custom/updater":{
        "format": "  {} Updates",
        "exec": "checkupdates | wc -l",
        "exec-if": "[[ $(checkupdates | wc -l) != 0 ]]",
        "interval": 15,
        "on-click": "alacritty -e yay -Syu"
    }
      };
    };
  };
}
