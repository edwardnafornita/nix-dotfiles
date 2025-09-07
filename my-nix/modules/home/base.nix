{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fastfetch starship
  ];

  programs.starship.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if status is-interactive
        if test (tty) = "/dev/tty1" -a -z "$WAYLAND_DISPLAY"
	        exec Hyprland
	      end
      end
    '';
  };
  
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha"; 
    font = { name = "JetBrainsMono Nerd Font"; size = 11; };
    settings = {
      enable_audio_bell = "no";
      confirm_os_window_close = "0";
    };
  };
}

