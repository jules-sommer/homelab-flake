{ config, lib, pkgs, unstable, ... }:
{
  imports = [ ./gc ];

  options.nixpkgs.allowUnfreePackages = lib.mkOption {
    type = with lib.types; listOf str;
  };

  config = {
    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    _module.args.pkgsUnstable = import unstable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };
  };
}
