{ pkgs, ... }:
{
  # I use fish btw
  environment.shells = with pkgs; [ fish ];
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
}
