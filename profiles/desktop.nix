{ ... }:

{
  imports = [
    ../modules/system/base.nix
    ../modules/system/networking.nix
    ../modules/system/desktop-hyprland.nix

    ../modules/home/base.nix
    ../modules/home/hyprland.nix
    ../modules/home/waybar.nix
  ];
}

