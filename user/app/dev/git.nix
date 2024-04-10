{ pkgs, userSettings, ... }:
{
  # Enable Git
  programs.git = {
    enable = true;
    userName  = userSettings.username;
    userEmail = userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
