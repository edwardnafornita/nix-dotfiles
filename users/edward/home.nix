{ config, pkgs, ... }:

{
  home.username = "edward";
  home.homeDirectory = "/home/edward";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home-manager.backupFileExtension = "bak";

  imports = [
    ../../modules/home/base.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/waybar.nix
  ];
}

