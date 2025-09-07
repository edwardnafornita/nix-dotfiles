{
  description = "Modular NixOS with profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    mk = modules: hmMods:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = modules ++ [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";

            home-manager.users.edward = { ... }: {
              imports = [ ./users/edward/home.nix ] ++ hmMods;
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      nixos-programming = mk
        [
          ./hosts/nixos
          ./profiles/programming.nix
        ]
        [
          ./hm-profiles/base.nix
          ./hm-profiles/desktop.nix
          ./hm-profiles/programming.nix
        ];

      nixos-gaming = mk
        [
          ./hosts/nixos
          ./profiles/gaming.nix
        ]
        [
          ./hm-profiles/base.nix
          ./hm-profiles/desktop.nix
          ./hm-profiles/gaming.nix
        ];
    };
  };
}

