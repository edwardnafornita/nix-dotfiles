{ ... }: 

{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      height = 32;
      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "swaync" "cpu" "memory" "network" "battery" ];
      "hyprland/workspaces".disable-scroll = true;
      "hyprland/window".max-length = 80;
      clock.format = "{:%a %b %d  %H:%M}";
      network = {
        "format-wifi" = " {essid} {signalStrength}%";
        "format-ethernet" = "󰈀 {ifname}";
        "format-disconnected" = "󰖪 offline";
        interval = 5;
      };
      battery = {
        format = "{capacity}% {icon}";
        "format-icons" = [ "" "" "" "" "" ];
      };
      cpu.interval = 3;
      memory.interval = 5;
      swaync = {
        "tooltip" = false;
        "format" = "{icon}";
        "format-icons" = {
          "notification" = "";
          "none" = "";
          "dnd-notification" = "";
          "dnd-none" = "";
        };
        "on-click" = "swaync-client -t -sw";
        "on-click-right" = "swaync-client -d -sw";
      };
    }];
    style = ''
      * { font-family: "JetBrainsMono Nerd Font", "Noto Sans", sans-serif; }
      window#waybar { background: rgba(30,30,46,0.85); color: #cdd6f4; }
      #clock, #cpu, #memory, #battery, #network, #window, #swaync {
        padding: 0 10px; margin: 0 4px; border-radius: 8px; background: rgba(49,50,68,.9);
      }
    '';
  };
}

