{ config, pkgs, ... }:

{
  home.username = "edward";
  home.homeDirectory = "/home/edward";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home/base.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/waybar.nix
  ];

  home.stateVersion = "25.11";
}

