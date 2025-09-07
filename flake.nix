{
  description = "Edward's switchboard for HyDE / JaKooLit / ZaneyOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hydenix.url  = "path:../nix/hydenix";
    jakoolit.url = "path:../nix/NixOS-Hyprland";
    zaneyos.url  = "path:../nix/zaneyos";
  };

  outputs = { self, nixpkgs, hydenix, jakoolit, zaneyos, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    myHardware = ./hardware-configuration.nix;
    base = { ... }: {
      imports = [ myHardware ];
      networking.hostName = "nixos";
      system.stateVersion = "25.05";
    };
  in {
    nixosConfigurations = {
      hyde = lib.nixosSystem {
        inherit system;
        modules = [
          base
          hydenix.nixosModules.default
        ];
      };

      jakoolit = jakoolit.nixosConfigurations."NixOS-Hyprland";
      zaney-amd = zaneyos.nixosConfigurations.amd;
    };
  };
}

