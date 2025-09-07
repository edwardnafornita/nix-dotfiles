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
    systemd-boot.extraEntries."windows.conf" = ''
      title Windows
      efi /EFI/Microsoft/Boot/bootmgfw.efi
      device PARTUUID="e335c2e3-9ef6-4b37-9376-52e7c0c0bb39"
    '';
  };

  system.stateVersion = "25.05";
}

