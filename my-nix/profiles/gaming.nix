{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    vulkan-tools
    glxinfo
    gamemode
    mangohud
    vkbasalt
  ];
}

