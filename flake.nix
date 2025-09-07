{
  description = "Edward's switchboard for HyDE / JaKooLit / ZaneyOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hydenix.url  = "github:richen604/hydenix";
    jakoolit.url = "github:JaKooLit/NixOS-Hyprland";
    zaneyos.url  = "gitlab:Zaney/zaneyos";
  };

  outputs = { self, nixpkgs, hydenix, jakoolit, zaneyos, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    myHardware = ./hardware-configuration.nix;
    myBootLoader = ./boot.nix;
    myGPU = ./gpu.nix;
    myUser = ./user.nix;
    base = { ... }: {
      imports = [
        myHardware
	myBootLoader
	myGPU
	myUser
      ];
      networking.hostName = "nixos";
      system.stateVersion = "25.05";
    };
  in {
    nixosConfigurations = {
      hyde = lib.nixosSystem {
        inherit system;
        modules = [
          base
	  { nixpkgs.overlays = [ hydenix.overlays.default ]; }
          hydenix.nixosModules.default
        ];
      };

      jakoolit = jakoolit.nixosConfigurations."NixOS-Hyprland";
      zaney-amd = zaneyos.nixosConfigurations.amd;
    };
  };
}

