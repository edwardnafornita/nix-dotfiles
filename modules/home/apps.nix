{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ranger
    cliphist
    playerctl
    tmux
    fastfetch
  ];
}

