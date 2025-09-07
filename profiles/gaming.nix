{ pkgs, ... }:

{
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "steam" ''
      exec ${pkgs.steam}/bin/steam -forcedesktopscaling=1 -pipewire-dmabuf "$@"
    '')
  ];
}

