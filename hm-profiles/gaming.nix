{ pkgs, ... }:

{
  home.packages = with pkgs; [ mangohud goverlay protontricks ];
}

