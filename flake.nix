{

  description = "My first flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }:
    let
      # -------- System Settings -------- #
      systemSettings = {
        profile = "desktop";
	lib = nixpkgs.lib;
        system = "x86_64-linux";
	hostname = if (systemSettings.profile == "desktop") then "desky" else "zephy";
	timezone = "America/Chicago";
	locale = "en_US.UTF-8";
      };
      
      # -------- User Settings -------- #
      userSettings = {
        username = "thunlix";
        name = "Thunlix";
        email = "corbinrwatkins@protonmail.com";
	dotfilesDir = "~/.dotfiles";
	wm = "hyprland";
	wmType = if (userSettings.wm == "hyprland") then "wayland" else "x11";
	browser = "librewolf";
	term = "footclient";
	editor = "emacsclient";
	monitor = if (systemSettings.profile == "desktop") then "DP-2, 3440x1440@160, 0x0, 1" else "eDP, 2560x1440@165, 0x0, 1.25";
      };

      #pkgs = nixpkgs.legacyPackages.${systemSettings.system};
      pkgs = import nixpkgs { system = systemSettings.system; config.allowUnfree = true; };    

    in {
      nixosConfigurations = {
        desky = systemSettings.lib.nixosSystem {
          system = systemSettings.system;
	  modules = [ (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix") ];
          specialArgs = {
            inherit pkgs;
	    inherit systemSettings;
	    inherit userSettings;
          };
        };
	zephy = systemSettings.lib.nixosSystem {
          system = systemSettings.system;
          modules = [
	    nixos-hardware.nixosModules.asus-zephyrus-ga503; 
	    (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
          ];
          specialArgs = {
            inherit pkgs;
            inherit systemSettings;
            inherit userSettings;
          };
        };
      };
      homeConfigurations = {
        thunlix = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
          modules = [ (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") ];
          extraSpecialArgs = {
	    inherit userSettings;
          };
        };
      };
    };
}
