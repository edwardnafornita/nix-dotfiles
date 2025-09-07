{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    gh
    vscode
    nodejs
    python3
    gcc
    gnumake
    docker
  ];

  virtualisation.docker.enable = true;
}

