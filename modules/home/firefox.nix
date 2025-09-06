{ pkgs, ... }

let
  betterfox =  pkgs.fetchFromGitHub {
    owner = "yokoffing";
    repo = "Betterfox";
    rev = 7b3cee24cc7438eef040270b0464cde932e98ffb
    sha256 = "sha256-n4bqwdb55l8skw5dbb08rv5yizz9iq10=";
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

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin bitwarden darkreader
      ];

      policies = {
        DisableTelemetry = true;
	DisableFirefoxStudies = true;
	DisablePocket = true;
	PasswordManagerEnabled = false;
      };
    };
  };
}

