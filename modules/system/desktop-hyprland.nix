{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.systemPackages = with pkgs; [
    waybar wofi kitty
    swaynotificationcenter
    grim slurp swappy wl-clipboard
    brightnessctl pavucontrol
    networkmanagerapplet
  ];
}

