{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.systemPackages = with pkgs; [
    vesktop
    waybar
    wofi
    kitty
    swaynotificationcenter
    
    thunar
    thunar-archive-plugin
    gvfs
    udisks2

    grim
    slurp
    swappy
    wl-clipboard
    
    btop
    fastfetch

    noto-fonts
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
    papirus-icon-theme
    adwaita-qt

    brightnessctl
    pavucontrol
    networkmanagerapplet

    lxqt-policykit
  ];
}

