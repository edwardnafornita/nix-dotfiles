{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

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

    papirus-icon-theme
    adwaita-qt

    brightnessctl
    pavucontrol
    networkmanagerapplet

    lxqt.lxqt-policykit
  ];
}

