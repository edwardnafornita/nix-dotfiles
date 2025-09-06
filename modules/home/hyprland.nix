{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, B, exec, firefox"
        "$mod, T, exec, kitty"
	"$mod, D, exec, wofi --show drun"
	"$mod, Q, killactive"
      ];
      exec-once = [
        "waybar"
	"mako"
	"nm-applet --indicator"
      ];
    };
    extraConfig = ''
      monitor=DP-2,1920x1080@144,0x0,1
      monitor=DP-3,1920x1080@144,1920x0,1
    '';
  };

  systemd.user.services.swaync = {
    Unit.Description = "Sway Notification Center";
    Service.ExecStart = "${pkgs.swaynotificationcenter}/bin/swaync";
    Service.Restart = "on-failure";
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services.nm-applet = {
    Unit.Description = "NetworkManager Applet";
    Service.ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator";
    Install.WantedBy = [ "graphical-session.target" ];
  };
}

