{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ranger
    cliphist
    playerctl
    tmux
    fastfetch
  ];

  systemd.user.services.lxqt-policykit = {
    Unit = {
      Description = "LXQt PolicyKit agent";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}

