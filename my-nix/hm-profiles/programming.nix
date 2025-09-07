{ pkgs, ... }:

{
  home.packages = with pkgs; [ tmux ripgrep fd jq lazygit ];

  programs.tmux.enable = true;
}

