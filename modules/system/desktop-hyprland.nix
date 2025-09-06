{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    vesktop
    waybar
    wofi
    kitty
    swaynotificationcenter
    
    xfce.thunar
    xfce.thunar-archive-plugin
    gvfs
    udisks2
    xarchiver

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

