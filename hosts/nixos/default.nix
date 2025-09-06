{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/desktop.nix
    ../../users/edward/system.nix
  ];

  networking.hostName = "nixos";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}

