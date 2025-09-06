{ pkgs, ... }:

{
  users.users.edward = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}

