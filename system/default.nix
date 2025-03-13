{ lib, ... }:
{
  imports = [
    ./accounts
    ./devices
    ./modules
    ./nix
    ./programs
    ./secrets
    ./services
  ];

  networking = {
    hostName = "progesterone";
    hostId = "e0b1fcef";
  };

  progesterone = {
    vaultwarden.enable = true;
  };

  time.timeZone = "America/Toronto";
  system.stateVersion = "24.11";
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
