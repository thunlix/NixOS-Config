{ config, pkgs, ... }:

let
  pam = pkgs.pam;
in

{
  services.pam.configFile = ''
    [yubiask]
    auth = ${pam}/lib/security/pam-u2f.so
  '';
}
