{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fastfetch
    btop
    ranger
  ];

  programs.fish.enable = true;
  programs.starship.enable = true;
  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "Edward Nafornita";
    userEmail = "contact@edwardnafornita.com";
  };
}

