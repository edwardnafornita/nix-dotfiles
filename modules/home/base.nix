{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fastfetch starship
  ];

  programs.starship.enable = true;
  programs.fish.enable = true;
  
  programs.kitty = {
    enable = true;
    themeFile = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Mocha.conf";
    font = { name = "JetBrainsMono Nerd Font"; size = 11; };
    settings = {
      enable_audio_bell = "no";
      confirm_os_window_close = "0";
    };
  };
}

