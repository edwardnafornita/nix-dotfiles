{ pkgs, ... }:

let
  betterfox =  pkgs.fetchFromGitHub {
    owner = "yokoffing";
    repo = "Betterfox";
    rev = "7b3cee24cc7438eef040270b0464cde932e98ffb";
    sha256 = "sha256-aTNEsopnGVueM7MZaYMPUMSJDJeADpvM33UcgO8nz88=";
  };

  core = builtins.readFile (betterfox + "/user.js");
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    profiles.default = {
      isDefault = true;

      extraConfig = ''
        ${core}

	user_pref("privacy.resistFingerprinting.letterboxing", true);
      '';

    };
    
    policies = {
      DisableTelemetry = true;
      DisablePocket = true;
      PasswordManagerEnabled = false;
    };
  };
}

