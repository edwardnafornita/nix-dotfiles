{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    terminal = "screen-256color";
    extraConfig = ''
      set -g mouse on
      set -g history-limit 10000
      bind r source-file ~/.tmux.conf \; display "Config reloaded!"
    '';
  };
}

