{ pkgs, ... }:

{
  users.users.edward = {
    isNormalUser = true;
    description = "Edward";
    home = "/home/edward";
    extraGroups = [ "wheel" "networkmanager" "audio" "input" "video" ];
    shell = pkgs.fish
  };

  security.sudo.wheelNeedsPassword = true;
}
