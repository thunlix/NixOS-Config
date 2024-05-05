{ pkgs, ... }:
{
  # Enable Foot terminal
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono:size=12";
        pad = "10x10";
      };
      colors = {
        alpha = 0.4;
        background = "111016";
      };
    };
  };

  # Enable Starship
  programs.starship =
    let
      flavour = "mocha"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
    in
    {
      enable = true;
      settings = {
        # Other config here
        format = "$all"; # Remove this line to disable the default prompt format
        palette = "catppuccin_mocha";
      } // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "4b969dc174d9e0c4c7066d7447e1b1ba6901ba3b"; # Replace with the latest commit hash
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          } + /palettes/mocha.toml));
    };
}
