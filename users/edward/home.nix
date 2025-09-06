{ config, pkgs, ... }:

{
  home.username = "edward";
  home.homeDirectory = "/home/edward";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home/base.nix
    ../../modules/home/firefox.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/tmux.nix
    ../../modules/home/waybar.nix
  ];
}

