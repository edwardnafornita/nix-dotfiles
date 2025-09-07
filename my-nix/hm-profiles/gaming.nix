{ config, pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "steam" ''
      export STEAM_USE_WAYLAND=1
      export NIXOS_OZONE_WL=1
      exec ${pkgs.steam}/bin/steam -forcedesktopscaling=1 -pipewire-dmabuf "$@"
    '')
  ];

  xdg.desktopEntries.steam = {
    name = "Steam";
    exec = "steam %U";
    terminal = false;
    type = "Application";
    categories = [ "Game" ];
    icon = "steam";
  };
}
