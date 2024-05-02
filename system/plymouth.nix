{ pkgs, config, ... }:
{
  boot = {
    plymouth = {
      enable = true;
      themePackages = with pkgs; [ (adi1090x-plymouth-themes.override {selected_themes = [ "hud_3" ]; }) ];
      theme = "hud_3";
    };
  };
}
