{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, alacritty"
	"$mod, D, exec, wofi --show drun"
	"$mod, Q, killactive"
      ];
      exec-once = [
        "waybar"
	"mako"
	"nm-applet --indicator"
      ];
    };
  };
}

