{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.systemPackages = with pkgs; [
    waybar wofi alacritty
    grim slurp swappy wl-clipboard
    brightnessctl pavucontrol mako
    networkmanagerapplet
  ];
}

