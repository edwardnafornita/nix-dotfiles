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
    '';
  };

  system.stateVersion = "25.05";
}

