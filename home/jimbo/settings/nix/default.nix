{ config, lib, pkgs, unstable, ... }:
{
  nix = {
    package = lib.mkForce pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    registry.unstable.flake = unstable;
  };

  _module.args.pkgsUnstable = import unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
}
