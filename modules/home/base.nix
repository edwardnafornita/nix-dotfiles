{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fastfetch zellij starship
  ];

  programs.starship.enable = true;
}

