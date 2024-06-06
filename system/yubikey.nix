{ pkgs, ...}:

let
  custom_pam_module = (import ./custom_pam_module.nix).configFile;
  yubiloop = "${pkgs.bash}/bin/bash -c './yubiloop.sh'";
in

{
  services.udev.packages = [ pkgs.yubikey-personalization ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.pam.yubico = {
    mode = "challenge-response";
  };

  security.pam.services = {
    login.u2fAuth = true;
    login.yubicoAuth = true;
    sudo.u2fAuth = true;
    sudo.yubicoAuth = true;
  };

  services.pam.configFile = ''
    [pam-u2f]
    ${custom_pam_module}

    [login]
    auth = pam-u2f.so
    preauth = ${yubiloop}
  '';
}
