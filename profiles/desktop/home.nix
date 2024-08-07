
{ config, pkgs, unstable, userSettings, catppuccin, ... }:
{

  imports = [
    (./. + "../../../user/app/polkit-kde-agent.nix")
    (./. + "../../../user/app/standardnotes.nix")
    (./. + "../../../user/app/wl-clipboard.nix")
    (./. + "../../../user/app/logseq.nix")
    (./. + "../../../user/app/webcord.nix")
    (./. + "../../../user/app/telegram-desktop.nix")
    (./. + "../../../user/app/brightnessctl.nix")
    (./. + "../../../user/app/xdg-desktop-portal-hyprland.nix")
    (./. + "../../../user/app/hyprpicker.nix")
    #(./. + "../../../user/app/youtube-dl.nix")
    (./. + "../../../user/app/ncmpcpp.nix")
    (./. + "../../../user/app/cava.nix")
    (./. + "../../../user/app/btop.nix")
    (./. + "../../../user/app/waybar.nix")
    (./. + "../../../user/app/wev.nix")
    (./. + "../../../user/app/vscode.nix")
    (./. + "../../../user/app/gucharmap.nix")
    (./. + "../../../user/app/gnome-font-viewer.nix")
    (./. + "../../../user/app/libappindicator.nix")
    (./. + "../../../user/app/mpd.nix")
    (./. + "../../../user/app/lm_sensors.nix")
    (./. + "../../../user/app/distrobox.nix")
    (./. + "../../../user/app/wofi.nix")
    (./. + "../../../user/app/dunst.nix")
    (./. + "../../../user/app/dev/git.nix")
    (./. + "../../../user/app/term/foot.nix")
    (./. + "../../../user/app/editor/emacs.nix")
    (./. + "../../../user/app/sync/syncthing.nix")
    (./. + "../../../user/shell/sh.nix")
    (./. + "../../../user/app/browser/librewolf.nix")
    (./. + "../../../user/app/popsicle.nix")
    (./. + "../../../user/app/immersed-vr.nix")
    (./. + "../../../user/app/nodejs.nix")
    # (./. + "../../../user/app/wayvnc.nix")
    (./. +  "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  # Set GTK mouse theme
  gtk = {
    enable = true;
    theme = {
        name = "Catppuccin-Mocha-Compact-Pink-Dark";
        package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        variant = "mocha";
      };
    };

    cursorTheme = {
      name = "Catppuccin-Mocha-Pink-Cursors";
      package = pkgs.catppuccin-cursors.mochaPink;
      size = 20;
    };
  };

  qt.enable = true;
  qt.platformTheme = "gtk";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.mochaPink;
    name = "Catppuccin-Mocha-Pink-Cursors";
    size = 20;
  };
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
    pkgs.grim
    pkgs.slurp
    unstable.swww
    unstable.waypaper
    pkgs.hyprpaper
    pkgs.polkit_gnome
    unstable.ironbar
    pkgs.python3
    pkgs.haskellPackages.sysinfo
    pkgs.bc
    pkgs.wget
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

  # Add paths to $PATH
  home.sessionPath = ["$HOME/.config/emacs/bin"];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
